import 'package:contacts_service/contacts_service.dart' as cs;
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novandi/core_module/gen/assets.gen.dart';
import 'package:novandi/core_module/widgets/app_toast.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  final TextEditingController nama = TextEditingController();
  final TextEditingController noHP = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission()) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  _saveContact() async {
    var newPerson = cs.Contact()
      ..displayName = nama.value.text
      ..givenName = nama.value.text
      ..phones = [cs.Item(label: "mobile", value: noHP.value.text,)];

    var permision= await Permission.contacts.status;
    if (permision.isGranted) {
      await cs.ContactsService.addContact(newPerson);
      var contacts = await cs.ContactsService.getContacts();
      print("Contact added successfully");
      _fetchContacts();
      return contacts;

    }
  }


@override
Widget build(BuildContext context) =>
    MaterialApp(
      home: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery
                  .sizeOf(context)
                  .height * 0.1),
          child: FloatingActionButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Contact'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          TextFormField(
                            controller: nama,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Nama',
                              fillColor: Colors.white,
                              filled: true,
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: noHP,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              hintText: 'No HP',
                              fillColor: Colors.white,
                              filled: true,
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                            ),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Masukan No HP Dengan Benar';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Tambahkan'),
                        onPressed: () async {
                          _saveContact();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
        body: _body(),
      ),
    );

Widget _body() {
  if (_permissionDenied) {
    return const Center(child: Text('Permission denied'));
  }
  if (_contacts == null) {
    return const Center(child: CircularProgressIndicator());
  }
  double jarakAtas = 130;
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: jarakAtas,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery
                    .sizeOf(context)
                    .width,
                child: Assets.png.header.image(fit: BoxFit.fill),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Contact',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: _contacts!.length,
            itemBuilder: (context, i) =>
                ListTile(
                    title: Text(_contacts![i].displayName),
                    onTap: () async {
                      FlutterContacts.getContact(_contacts![i].id).then((
                          value) =>
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(value?.displayName ?? ''),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('First name: ${value?.name.first}'),
                                      Text('Last name: ${value?.name.last}'),
                                      Text(
                                          'Phone number: ${value!.phones
                                              .isNotEmpty ? value.phones.first
                                              .number : '(none)'}'),
                                      Text(
                                          'Email address: ${value!.emails
                                              .isNotEmpty ? value.emails.first
                                              .address : '(none)'}'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Call'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Exit'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          ));
                    })),
      ],
    ),
  );
}}
