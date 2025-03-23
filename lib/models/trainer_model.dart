import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trainer_model.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class Trainer {
  Trainer({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.email,
    required this.password,
    required this.dob,
    required this.city,
    required this.gender,
    required this.nationality,
    required this.residence,
    required this.id,
    required this.specializations,
    required this.trainingService,
    this.images,
    this.videos,
    this.playlists,
    this.reviews,
    this.profileComments,
    this.packages,
    this.userImg,
    this.certificates,
  });

  factory Trainer.fromJson(Map<String, Object?> json) =>
      _$TrainerFromJson(json);

  String firstName;
  String lastName;
  int mobileNo;
  String email;
  String password;
  String dob;
  String city;
  String gender;
  String nationality;
  String residence;
  String id;
  List<String> specializations;
  List<Map> trainingService;
  List<Map>? images;
  List<Map>? videos;
  List<Map>? playlists;
  List<Map>? reviews;
  List<Map>? profileComments;
  List<Map>? packages;
  String? userImg;
  List<Map>? certificates;

  Map<String, Object?> toJson() => _$TrainerToJson(this);
}

@Collection<Trainer>('Trainers')
final trainersRef = TrainerCollectionReference();

Future<Trainer?> readData({required String trainerID}) async {
  Trainer? trainerData;

  await trainersRef.doc(trainerID).get().then((value) {
    trainerData = value.data;
    return trainerData;
  }).catchError((error) => print("Failed to add user: $error"));
  ;

  return trainerData;
}

Future<Trainer?> getTraingerWithEmail({required String trainerEmail}) async {
  Trainer? trainerData;

  await trainersRef
      .whereEmail(isEqualTo: trainerEmail)
      .limit(1)
      .get()
      .then((value) {
    trainerData = value.docs[0].data;
    print('data: ${trainerData!.city}');
    return trainerData;
  }).catchError((error) => print("Failed to add user: $error"));

  return trainerData;
}

Future<String> addNewTrainer(
    {required String fName,
    required String lName,
    required String email,
    required String password,
    required int mobileNo,
    required String dob,
    required String city,
    required String nationality,
    required String residence,
    required String gender,
    required List<String> specializations,
    required List<Map> trainingService}) async {
  String? msg = "null string";

  final docRef = trainersRef.doc();

  Trainer trainerData = new Trainer(
      id: docRef.id,
      firstName: fName,
      lastName: lName,
      mobileNo: mobileNo,
      email: email,
      password: password,
      dob: dob,
      city: city,
      gender: gender,
      nationality: nationality,
      residence: residence,
      specializations: specializations,
      trainingService: trainingService);

  try {
    await docRef.set(trainerData).then((value) {
      msg = "Trainer added successfully";
      return msg;
    });
  } catch (error) {
    if (error is FirebaseException) {
      msg = "Firebase error: ${error.message.toString()}";

      return Future.value(msg);
    } else {
      msg = "something went wrong!";
      return Future.value(msg);
    }
  }

  return Future.value(msg);
}

Future<String> updateTrainer({required Trainer trainerData}) async {
  try {
    await trainersRef.doc(trainerData.id).set(trainerData).then(
      (value) {
        return "success";
      },
    );
  } catch (e) {
    if (e is FirebaseException) {
      return Future.value("Firebase error: ${e.message.toString()}");
    } else {
      return Future.value("something went wrong!");
    }
  }

  return Future.value("Unexpected Error!");
}

Future<Map> getTrainerWUserName({required String email, required pass}) async {
  try {
    TrainerQuerySnapshot trainerData = await trainersRef
        .whereEmail(isEqualTo: email)
        .wherePassword(isEqualTo: pass)
        .limit(1)
        .get();
    print("data = ${trainerData.docs[0].data.id}");

    Map data = {
      'msg': "Success",
      'data': trainerData.docs[0].data,
    };

    return data;
  } catch (e) {
    if (e is FirebaseException) {
      Map data = {
        'msg': e.message,
        'data': null,
      };
      return data;
    } else {
      Map data = {
        'msg': "Invalid Username or Password!",
        'data': null,
      };
      return data;
    }
  }
}

Future<bool> checkIfUserExists({
  required String email,
}) async {
  TrainerQuerySnapshot trainerData =
      await trainersRef.whereEmail(isEqualTo: email).limit(1).get();

  if (trainerData.docs.length <= 0) {
    return false;
  } else {
    return true;
  }
}

Future<List<TrainerQueryDocumentSnapshot>>? getAllTrainers() async {
  List<TrainerQueryDocumentSnapshot>? trainers;

  TrainerQuerySnapshot trainerData = await trainersRef.get();
  print("data = ${trainerData}");

  trainers = trainerData.docs;
  return trainers;
}

deleteAllTrainers() {
  FirebaseFirestore.instance.collection("Trainers").snapshots().forEach(
        (snapshot) => {
          for (QueryDocumentSnapshot ds in snapshot.docs)
            {ds.reference.delete()}
        },
      );
}
