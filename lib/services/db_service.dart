import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/admin.dart';
import '../models/berita.dart';
import '../models/absensi.dart';
import '../models/program_kerja.dart';
import '../models/struktur_organisasi.dart';

class DBService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_new.db'); // Ganti nama database

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE admin (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE berita (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE absensi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        tanggal TEXT,
        hadir INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE program_kerja (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE struktur_organisasi (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        periode TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE tentang (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        prodiSi TEXT,
        sisforSpace TEXT
      )
    ''');

    await db.insert('admin', {
      'username': 'admin',
      'password': 'admin',
    });
  }

  // Future<void> insertAdmin(Admin admin) async {
  //   final db = await database;
  //   await db.insert('admin', admin.toMap());
  // }

  Future<Admin?> getAdmin(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'admin',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return Admin.fromMap(result.first);
    }
    return null;
  }

  Future<void> insertBerita(Berita berita) async {
    final db = await database;
    await db.insert('berita', berita.toMap());
  }

  Future<List<Berita>> getAllBerita() async {
    final db = await database;
    final result = await db.query('berita');
    return result.map((map) => Berita.fromMap(map)).toList();
  }

  Future<void> updateBerita(Berita berita) async {
    final db = await database;
    await db.update(
      'berita',
      berita.toMap(),
      where: 'id = ?',
      whereArgs: [berita.id],
    );
  }

  Future<void> deleteBerita(int id) async {
    final db = await database;
    await db.delete(
      'berita',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertAbsensi(Absensi absensi) async {
    final db = await database;
    await db.insert('absensi', absensi.toMap());
  }

  Future<List<Absensi>> getAllAbsensi() async {
    final db = await database;
    final result = await db.query('absensi');
    return result.map((map) => Absensi.fromMap(map)).toList();
  }

  Future<void> updateAbsensi(Absensi absensi) async {
    final db = await database;
    await db.update(
      'absensi',
      absensi.toMap(),
      where: 'id = ?',
      whereArgs: [absensi.id],
    );
  }

  Future<void> deleteAbsensi(int id) async {
    final db = await database;
    await db.delete(
      'absensi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertProgramKerja(ProgramKerja programKerja) async {
    final db = await database;
    await db.insert('program_kerja', programKerja.toMap());
  }

  Future<List<ProgramKerja>> getAllProgramKerja() async {
    final db = await database;
    final result = await db.query('program_kerja');
    return result.map((map) => ProgramKerja.fromMap(map)).toList();
  }

  Future<void> updateProgramKerja(ProgramKerja programKerja) async {
    final db = await database;
    await db.update(
      'program_kerja',
      programKerja.toMap(),
      where: 'id = ?',
      whereArgs: [programKerja.id],
    );
  }

  Future<void> deleteProgramKerja(int id) async {
    final db = await database;
    await db.delete(
      'program_kerja',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> insertStrukturOrganisasi(
      StrukturOrganisasi strukturOrganisasi) async {
    final db = await database;
    await db.insert('struktur_organisasi', strukturOrganisasi.toMap());
  }

  Future<List<StrukturOrganisasi>> getAllStrukturOrganisasi() async {
    final db = await database;
    final result = await db.query('struktur_organisasi');
    return result.map((map) => StrukturOrganisasi.fromMap(map)).toList();
  }

  Future<void> updateStrukturOrganisasi(
      StrukturOrganisasi strukturOrganisasi) async {
    final db = await database;
    await db.update(
      'struktur_organisasi',
      strukturOrganisasi.toMap(),
      where: 'id = ?',
      whereArgs: [strukturOrganisasi.id],
    );
  }

  Future<void> deleteStrukturOrganisasi(int id) async {
    final db = await database;
    await db.delete(
      'struktur_organisasi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
