import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFFFF3F6),
        primaryColor: const Color(0xFFFFA6C9),
      ),
      home: const HomePage(),
    );
  }
}

// ===================== HALAMAN UTAMA =====================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F6),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ICON PROFIL
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFA6C9), Color(0xFFFFC1D9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color(0xFFFFA6C9),
                    size: 70,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Mahasiswa Sistem Informasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD81B60),
                ),
              ),
              const SizedBox(height: 30),

              // TOMBOL LIHAT PROFIL
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA6C9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text(
                  'Lihat Profil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===================== HALAMAN PROFIL =====================
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nama = 'Mia Faradila';
  String jurusan = 'Sistem Informasi';
  String universitas = 'Sulthan Thaha Syaifuddin Jambi';
  String email = 'miafaradilaazwar@gmail.com';
  String noHp = '081287836626';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Mahasiswa',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFA6C9),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFF3F6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // ICON PROFIL
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFFA6C9), Color(0xFFFFC1D9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Color(0xFFFFA6C9),
                  size: 60,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // DATA PROFIL
            profileItem('Nama', nama),
            profileItem('Jurusan', jurusan),
            profileItem('Universitas', universitas),
            profileItem('Email', email),
            profileItem('No HP', noHp),

            const SizedBox(height: 30),

            // TOMBOL EDIT
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      nama: nama,
                      jurusan: jurusan,
                      universitas: universitas,
                      email: email,
                      noHp: noHp,
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    nama = result['nama'];
                    jurusan = result['jurusan'];
                    universitas = result['universitas'];
                    email = result['email'];
                    noHp = result['noHp'];
                  });
                }
              },
              icon: const Icon(Icons.edit, size: 18),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA6C9),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileItem(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFD81B60),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

// ===================== HALAMAN EDIT PROFIL =====================
class EditProfilePage extends StatefulWidget {
  final String nama, jurusan, universitas, email, noHp;
  const EditProfilePage({
    super.key,
    required this.nama,
    required this.jurusan,
    required this.universitas,
    required this.email,
    required this.noHp,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController namaController;
  late TextEditingController jurusanController;
  late TextEditingController universitasController;
  late TextEditingController emailController;
  late TextEditingController noHpController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.nama);
    jurusanController = TextEditingController(text: widget.jurusan);
    universitasController = TextEditingController(text: widget.universitas);
    emailController = TextEditingController(text: widget.email);
    noHpController = TextEditingController(text: widget.noHp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFFFA6C9),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFFFF3F6),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            buildTextField('Nama', namaController),
            buildTextField('Jurusan', jurusanController),
            buildTextField('Universitas', universitasController),
            buildTextField('Email', emailController),
            buildTextField('No HP', noHpController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'nama': namaController.text,
                  'jurusan': jurusanController.text,
                  'universitas': universitasController.text,
                  'email': emailController.text,
                  'noHp': noHpController.text,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFA6C9),
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text(
                'Simpan Perubahan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFFA6C9), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}