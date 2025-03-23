// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class TrainerCollectionReference
    implements
        TrainerQuery,
        FirestoreCollectionReference<Trainer, TrainerQuerySnapshot> {
  factory TrainerCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TrainerCollectionReference;

  static Trainer fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Trainer.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Trainer value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Trainer> get reference;

  @override
  TrainerDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TrainerDocumentReference> add(Trainer value);
}

class _$TrainerCollectionReference extends _$TrainerQuery
    implements TrainerCollectionReference {
  factory _$TrainerCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TrainerCollectionReference._(
      firestore.collection('Trainers').withConverter(
            fromFirestore: TrainerCollectionReference.fromFirestore,
            toFirestore: TrainerCollectionReference.toFirestore,
          ),
    );
  }

  _$TrainerCollectionReference._(
    CollectionReference<Trainer> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Trainer> get reference =>
      super.reference as CollectionReference<Trainer>;

  @override
  TrainerDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return TrainerDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TrainerDocumentReference> add(Trainer value) {
    return reference.add(value).then((ref) => TrainerDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TrainerCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TrainerDocumentReference
    extends FirestoreDocumentReference<Trainer, TrainerDocumentSnapshot> {
  factory TrainerDocumentReference(DocumentReference<Trainer> reference) =
      _$TrainerDocumentReference;

  DocumentReference<Trainer> get reference;

  /// A reference to the [TrainerCollectionReference] containing this document.
  TrainerCollectionReference get parent {
    return _$TrainerCollectionReference(reference.firestore);
  }

  @override
  Stream<TrainerDocumentSnapshot> snapshots();

  @override
  Future<TrainerDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    int mobileNo,
    FieldValue mobileNoFieldValue,
    String email,
    FieldValue emailFieldValue,
    String password,
    FieldValue passwordFieldValue,
    String dob,
    FieldValue dobFieldValue,
    String city,
    FieldValue cityFieldValue,
    String gender,
    FieldValue genderFieldValue,
    String nationality,
    FieldValue nationalityFieldValue,
    String residence,
    FieldValue residenceFieldValue,
    String id,
    FieldValue idFieldValue,
    List<String> specializations,
    FieldValue specializationsFieldValue,
    List<Map<dynamic, dynamic>> trainingService,
    FieldValue trainingServiceFieldValue,
    List<Map<dynamic, dynamic>>? images,
    FieldValue imagesFieldValue,
    List<Map<dynamic, dynamic>>? videos,
    FieldValue videosFieldValue,
    List<Map<dynamic, dynamic>>? playlists,
    FieldValue playlistsFieldValue,
    List<Map<dynamic, dynamic>>? reviews,
    FieldValue reviewsFieldValue,
    List<Map<dynamic, dynamic>>? profileComments,
    FieldValue profileCommentsFieldValue,
    List<Map<dynamic, dynamic>>? packages,
    FieldValue packagesFieldValue,
    String? userImg,
    FieldValue userImgFieldValue,
    List<Map<dynamic, dynamic>>? certificates,
    FieldValue certificatesFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String firstName,
    FieldValue firstNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    int mobileNo,
    FieldValue mobileNoFieldValue,
    String email,
    FieldValue emailFieldValue,
    String password,
    FieldValue passwordFieldValue,
    String dob,
    FieldValue dobFieldValue,
    String city,
    FieldValue cityFieldValue,
    String gender,
    FieldValue genderFieldValue,
    String nationality,
    FieldValue nationalityFieldValue,
    String residence,
    FieldValue residenceFieldValue,
    String id,
    FieldValue idFieldValue,
    List<String> specializations,
    FieldValue specializationsFieldValue,
    List<Map<dynamic, dynamic>> trainingService,
    FieldValue trainingServiceFieldValue,
    List<Map<dynamic, dynamic>>? images,
    FieldValue imagesFieldValue,
    List<Map<dynamic, dynamic>>? videos,
    FieldValue videosFieldValue,
    List<Map<dynamic, dynamic>>? playlists,
    FieldValue playlistsFieldValue,
    List<Map<dynamic, dynamic>>? reviews,
    FieldValue reviewsFieldValue,
    List<Map<dynamic, dynamic>>? profileComments,
    FieldValue profileCommentsFieldValue,
    List<Map<dynamic, dynamic>>? packages,
    FieldValue packagesFieldValue,
    String? userImg,
    FieldValue userImgFieldValue,
    List<Map<dynamic, dynamic>>? certificates,
    FieldValue certificatesFieldValue,
  });
}

class _$TrainerDocumentReference
    extends FirestoreDocumentReference<Trainer, TrainerDocumentSnapshot>
    implements TrainerDocumentReference {
  _$TrainerDocumentReference(this.reference);

  @override
  final DocumentReference<Trainer> reference;

  /// A reference to the [TrainerCollectionReference] containing this document.
  TrainerCollectionReference get parent {
    return _$TrainerCollectionReference(reference.firestore);
  }

  @override
  Stream<TrainerDocumentSnapshot> snapshots() {
    return reference.snapshots().map(TrainerDocumentSnapshot._);
  }

  @override
  Future<TrainerDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(TrainerDocumentSnapshot._);
  }

  @override
  Future<TrainerDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(TrainerDocumentSnapshot._);
  }

  Future<void> update({
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? mobileNo = _sentinel,
    FieldValue? mobileNoFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? password = _sentinel,
    FieldValue? passwordFieldValue,
    Object? dob = _sentinel,
    FieldValue? dobFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? gender = _sentinel,
    FieldValue? genderFieldValue,
    Object? nationality = _sentinel,
    FieldValue? nationalityFieldValue,
    Object? residence = _sentinel,
    FieldValue? residenceFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? specializations = _sentinel,
    FieldValue? specializationsFieldValue,
    Object? trainingService = _sentinel,
    FieldValue? trainingServiceFieldValue,
    Object? images = _sentinel,
    FieldValue? imagesFieldValue,
    Object? videos = _sentinel,
    FieldValue? videosFieldValue,
    Object? playlists = _sentinel,
    FieldValue? playlistsFieldValue,
    Object? reviews = _sentinel,
    FieldValue? reviewsFieldValue,
    Object? profileComments = _sentinel,
    FieldValue? profileCommentsFieldValue,
    Object? packages = _sentinel,
    FieldValue? packagesFieldValue,
    Object? userImg = _sentinel,
    FieldValue? userImgFieldValue,
    Object? certificates = _sentinel,
    FieldValue? certificatesFieldValue,
  }) async {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      mobileNo == _sentinel || mobileNoFieldValue == null,
      "Cannot specify both mobileNo and mobileNoFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      password == _sentinel || passwordFieldValue == null,
      "Cannot specify both password and passwordFieldValue",
    );
    assert(
      dob == _sentinel || dobFieldValue == null,
      "Cannot specify both dob and dobFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      gender == _sentinel || genderFieldValue == null,
      "Cannot specify both gender and genderFieldValue",
    );
    assert(
      nationality == _sentinel || nationalityFieldValue == null,
      "Cannot specify both nationality and nationalityFieldValue",
    );
    assert(
      residence == _sentinel || residenceFieldValue == null,
      "Cannot specify both residence and residenceFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      specializations == _sentinel || specializationsFieldValue == null,
      "Cannot specify both specializations and specializationsFieldValue",
    );
    assert(
      trainingService == _sentinel || trainingServiceFieldValue == null,
      "Cannot specify both trainingService and trainingServiceFieldValue",
    );
    assert(
      images == _sentinel || imagesFieldValue == null,
      "Cannot specify both images and imagesFieldValue",
    );
    assert(
      videos == _sentinel || videosFieldValue == null,
      "Cannot specify both videos and videosFieldValue",
    );
    assert(
      playlists == _sentinel || playlistsFieldValue == null,
      "Cannot specify both playlists and playlistsFieldValue",
    );
    assert(
      reviews == _sentinel || reviewsFieldValue == null,
      "Cannot specify both reviews and reviewsFieldValue",
    );
    assert(
      profileComments == _sentinel || profileCommentsFieldValue == null,
      "Cannot specify both profileComments and profileCommentsFieldValue",
    );
    assert(
      packages == _sentinel || packagesFieldValue == null,
      "Cannot specify both packages and packagesFieldValue",
    );
    assert(
      userImg == _sentinel || userImgFieldValue == null,
      "Cannot specify both userImg and userImgFieldValue",
    );
    assert(
      certificates == _sentinel || certificatesFieldValue == null,
      "Cannot specify both certificates and certificatesFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$TrainerFieldMap['firstName']!:
            _$TrainerPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$TrainerFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$TrainerFieldMap['lastName']!:
            _$TrainerPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$TrainerFieldMap['lastName']!: lastNameFieldValue,
      if (mobileNo != _sentinel)
        _$TrainerFieldMap['mobileNo']!:
            _$TrainerPerFieldToJson.mobileNo(mobileNo as int),
      if (mobileNoFieldValue != null)
        _$TrainerFieldMap['mobileNo']!: mobileNoFieldValue,
      if (email != _sentinel)
        _$TrainerFieldMap['email']!:
            _$TrainerPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$TrainerFieldMap['email']!: emailFieldValue,
      if (password != _sentinel)
        _$TrainerFieldMap['password']!:
            _$TrainerPerFieldToJson.password(password as String),
      if (passwordFieldValue != null)
        _$TrainerFieldMap['password']!: passwordFieldValue,
      if (dob != _sentinel)
        _$TrainerFieldMap['dob']!: _$TrainerPerFieldToJson.dob(dob as String),
      if (dobFieldValue != null) _$TrainerFieldMap['dob']!: dobFieldValue,
      if (city != _sentinel)
        _$TrainerFieldMap['city']!:
            _$TrainerPerFieldToJson.city(city as String),
      if (cityFieldValue != null) _$TrainerFieldMap['city']!: cityFieldValue,
      if (gender != _sentinel)
        _$TrainerFieldMap['gender']!:
            _$TrainerPerFieldToJson.gender(gender as String),
      if (genderFieldValue != null)
        _$TrainerFieldMap['gender']!: genderFieldValue,
      if (nationality != _sentinel)
        _$TrainerFieldMap['nationality']!:
            _$TrainerPerFieldToJson.nationality(nationality as String),
      if (nationalityFieldValue != null)
        _$TrainerFieldMap['nationality']!: nationalityFieldValue,
      if (residence != _sentinel)
        _$TrainerFieldMap['residence']!:
            _$TrainerPerFieldToJson.residence(residence as String),
      if (residenceFieldValue != null)
        _$TrainerFieldMap['residence']!: residenceFieldValue,
      if (id != _sentinel)
        _$TrainerFieldMap['id']!: _$TrainerPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$TrainerFieldMap['id']!: idFieldValue,
      if (specializations != _sentinel)
        _$TrainerFieldMap['specializations']!: _$TrainerPerFieldToJson
            .specializations(specializations as List<String>),
      if (specializationsFieldValue != null)
        _$TrainerFieldMap['specializations']!: specializationsFieldValue,
      if (trainingService != _sentinel)
        _$TrainerFieldMap['trainingService']!: _$TrainerPerFieldToJson
            .trainingService(trainingService as List<Map<dynamic, dynamic>>),
      if (trainingServiceFieldValue != null)
        _$TrainerFieldMap['trainingService']!: trainingServiceFieldValue,
      if (images != _sentinel)
        _$TrainerFieldMap['images']!: _$TrainerPerFieldToJson
            .images(images as List<Map<dynamic, dynamic>>?),
      if (imagesFieldValue != null)
        _$TrainerFieldMap['images']!: imagesFieldValue,
      if (videos != _sentinel)
        _$TrainerFieldMap['videos']!: _$TrainerPerFieldToJson
            .videos(videos as List<Map<dynamic, dynamic>>?),
      if (videosFieldValue != null)
        _$TrainerFieldMap['videos']!: videosFieldValue,
      if (playlists != _sentinel)
        _$TrainerFieldMap['playlists']!: _$TrainerPerFieldToJson
            .playlists(playlists as List<Map<dynamic, dynamic>>?),
      if (playlistsFieldValue != null)
        _$TrainerFieldMap['playlists']!: playlistsFieldValue,
      if (reviews != _sentinel)
        _$TrainerFieldMap['reviews']!: _$TrainerPerFieldToJson
            .reviews(reviews as List<Map<dynamic, dynamic>>?),
      if (reviewsFieldValue != null)
        _$TrainerFieldMap['reviews']!: reviewsFieldValue,
      if (profileComments != _sentinel)
        _$TrainerFieldMap['profileComments']!: _$TrainerPerFieldToJson
            .profileComments(profileComments as List<Map<dynamic, dynamic>>?),
      if (profileCommentsFieldValue != null)
        _$TrainerFieldMap['profileComments']!: profileCommentsFieldValue,
      if (packages != _sentinel)
        _$TrainerFieldMap['packages']!: _$TrainerPerFieldToJson
            .packages(packages as List<Map<dynamic, dynamic>>?),
      if (packagesFieldValue != null)
        _$TrainerFieldMap['packages']!: packagesFieldValue,
      if (userImg != _sentinel)
        _$TrainerFieldMap['userImg']!:
            _$TrainerPerFieldToJson.userImg(userImg as String?),
      if (userImgFieldValue != null)
        _$TrainerFieldMap['userImg']!: userImgFieldValue,
      if (certificates != _sentinel)
        _$TrainerFieldMap['certificates']!: _$TrainerPerFieldToJson
            .certificates(certificates as List<Map<dynamic, dynamic>>?),
      if (certificatesFieldValue != null)
        _$TrainerFieldMap['certificates']!: certificatesFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? mobileNo = _sentinel,
    FieldValue? mobileNoFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? password = _sentinel,
    FieldValue? passwordFieldValue,
    Object? dob = _sentinel,
    FieldValue? dobFieldValue,
    Object? city = _sentinel,
    FieldValue? cityFieldValue,
    Object? gender = _sentinel,
    FieldValue? genderFieldValue,
    Object? nationality = _sentinel,
    FieldValue? nationalityFieldValue,
    Object? residence = _sentinel,
    FieldValue? residenceFieldValue,
    Object? id = _sentinel,
    FieldValue? idFieldValue,
    Object? specializations = _sentinel,
    FieldValue? specializationsFieldValue,
    Object? trainingService = _sentinel,
    FieldValue? trainingServiceFieldValue,
    Object? images = _sentinel,
    FieldValue? imagesFieldValue,
    Object? videos = _sentinel,
    FieldValue? videosFieldValue,
    Object? playlists = _sentinel,
    FieldValue? playlistsFieldValue,
    Object? reviews = _sentinel,
    FieldValue? reviewsFieldValue,
    Object? profileComments = _sentinel,
    FieldValue? profileCommentsFieldValue,
    Object? packages = _sentinel,
    FieldValue? packagesFieldValue,
    Object? userImg = _sentinel,
    FieldValue? userImgFieldValue,
    Object? certificates = _sentinel,
    FieldValue? certificatesFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      mobileNo == _sentinel || mobileNoFieldValue == null,
      "Cannot specify both mobileNo and mobileNoFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      password == _sentinel || passwordFieldValue == null,
      "Cannot specify both password and passwordFieldValue",
    );
    assert(
      dob == _sentinel || dobFieldValue == null,
      "Cannot specify both dob and dobFieldValue",
    );
    assert(
      city == _sentinel || cityFieldValue == null,
      "Cannot specify both city and cityFieldValue",
    );
    assert(
      gender == _sentinel || genderFieldValue == null,
      "Cannot specify both gender and genderFieldValue",
    );
    assert(
      nationality == _sentinel || nationalityFieldValue == null,
      "Cannot specify both nationality and nationalityFieldValue",
    );
    assert(
      residence == _sentinel || residenceFieldValue == null,
      "Cannot specify both residence and residenceFieldValue",
    );
    assert(
      id == _sentinel || idFieldValue == null,
      "Cannot specify both id and idFieldValue",
    );
    assert(
      specializations == _sentinel || specializationsFieldValue == null,
      "Cannot specify both specializations and specializationsFieldValue",
    );
    assert(
      trainingService == _sentinel || trainingServiceFieldValue == null,
      "Cannot specify both trainingService and trainingServiceFieldValue",
    );
    assert(
      images == _sentinel || imagesFieldValue == null,
      "Cannot specify both images and imagesFieldValue",
    );
    assert(
      videos == _sentinel || videosFieldValue == null,
      "Cannot specify both videos and videosFieldValue",
    );
    assert(
      playlists == _sentinel || playlistsFieldValue == null,
      "Cannot specify both playlists and playlistsFieldValue",
    );
    assert(
      reviews == _sentinel || reviewsFieldValue == null,
      "Cannot specify both reviews and reviewsFieldValue",
    );
    assert(
      profileComments == _sentinel || profileCommentsFieldValue == null,
      "Cannot specify both profileComments and profileCommentsFieldValue",
    );
    assert(
      packages == _sentinel || packagesFieldValue == null,
      "Cannot specify both packages and packagesFieldValue",
    );
    assert(
      userImg == _sentinel || userImgFieldValue == null,
      "Cannot specify both userImg and userImgFieldValue",
    );
    assert(
      certificates == _sentinel || certificatesFieldValue == null,
      "Cannot specify both certificates and certificatesFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$TrainerFieldMap['firstName']!:
            _$TrainerPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$TrainerFieldMap['firstName']!: firstNameFieldValue,
      if (lastName != _sentinel)
        _$TrainerFieldMap['lastName']!:
            _$TrainerPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$TrainerFieldMap['lastName']!: lastNameFieldValue,
      if (mobileNo != _sentinel)
        _$TrainerFieldMap['mobileNo']!:
            _$TrainerPerFieldToJson.mobileNo(mobileNo as int),
      if (mobileNoFieldValue != null)
        _$TrainerFieldMap['mobileNo']!: mobileNoFieldValue,
      if (email != _sentinel)
        _$TrainerFieldMap['email']!:
            _$TrainerPerFieldToJson.email(email as String),
      if (emailFieldValue != null) _$TrainerFieldMap['email']!: emailFieldValue,
      if (password != _sentinel)
        _$TrainerFieldMap['password']!:
            _$TrainerPerFieldToJson.password(password as String),
      if (passwordFieldValue != null)
        _$TrainerFieldMap['password']!: passwordFieldValue,
      if (dob != _sentinel)
        _$TrainerFieldMap['dob']!: _$TrainerPerFieldToJson.dob(dob as String),
      if (dobFieldValue != null) _$TrainerFieldMap['dob']!: dobFieldValue,
      if (city != _sentinel)
        _$TrainerFieldMap['city']!:
            _$TrainerPerFieldToJson.city(city as String),
      if (cityFieldValue != null) _$TrainerFieldMap['city']!: cityFieldValue,
      if (gender != _sentinel)
        _$TrainerFieldMap['gender']!:
            _$TrainerPerFieldToJson.gender(gender as String),
      if (genderFieldValue != null)
        _$TrainerFieldMap['gender']!: genderFieldValue,
      if (nationality != _sentinel)
        _$TrainerFieldMap['nationality']!:
            _$TrainerPerFieldToJson.nationality(nationality as String),
      if (nationalityFieldValue != null)
        _$TrainerFieldMap['nationality']!: nationalityFieldValue,
      if (residence != _sentinel)
        _$TrainerFieldMap['residence']!:
            _$TrainerPerFieldToJson.residence(residence as String),
      if (residenceFieldValue != null)
        _$TrainerFieldMap['residence']!: residenceFieldValue,
      if (id != _sentinel)
        _$TrainerFieldMap['id']!: _$TrainerPerFieldToJson.id(id as String),
      if (idFieldValue != null) _$TrainerFieldMap['id']!: idFieldValue,
      if (specializations != _sentinel)
        _$TrainerFieldMap['specializations']!: _$TrainerPerFieldToJson
            .specializations(specializations as List<String>),
      if (specializationsFieldValue != null)
        _$TrainerFieldMap['specializations']!: specializationsFieldValue,
      if (trainingService != _sentinel)
        _$TrainerFieldMap['trainingService']!: _$TrainerPerFieldToJson
            .trainingService(trainingService as List<Map<dynamic, dynamic>>),
      if (trainingServiceFieldValue != null)
        _$TrainerFieldMap['trainingService']!: trainingServiceFieldValue,
      if (images != _sentinel)
        _$TrainerFieldMap['images']!: _$TrainerPerFieldToJson
            .images(images as List<Map<dynamic, dynamic>>?),
      if (imagesFieldValue != null)
        _$TrainerFieldMap['images']!: imagesFieldValue,
      if (videos != _sentinel)
        _$TrainerFieldMap['videos']!: _$TrainerPerFieldToJson
            .videos(videos as List<Map<dynamic, dynamic>>?),
      if (videosFieldValue != null)
        _$TrainerFieldMap['videos']!: videosFieldValue,
      if (playlists != _sentinel)
        _$TrainerFieldMap['playlists']!: _$TrainerPerFieldToJson
            .playlists(playlists as List<Map<dynamic, dynamic>>?),
      if (playlistsFieldValue != null)
        _$TrainerFieldMap['playlists']!: playlistsFieldValue,
      if (reviews != _sentinel)
        _$TrainerFieldMap['reviews']!: _$TrainerPerFieldToJson
            .reviews(reviews as List<Map<dynamic, dynamic>>?),
      if (reviewsFieldValue != null)
        _$TrainerFieldMap['reviews']!: reviewsFieldValue,
      if (profileComments != _sentinel)
        _$TrainerFieldMap['profileComments']!: _$TrainerPerFieldToJson
            .profileComments(profileComments as List<Map<dynamic, dynamic>>?),
      if (profileCommentsFieldValue != null)
        _$TrainerFieldMap['profileComments']!: profileCommentsFieldValue,
      if (packages != _sentinel)
        _$TrainerFieldMap['packages']!: _$TrainerPerFieldToJson
            .packages(packages as List<Map<dynamic, dynamic>>?),
      if (packagesFieldValue != null)
        _$TrainerFieldMap['packages']!: packagesFieldValue,
      if (userImg != _sentinel)
        _$TrainerFieldMap['userImg']!:
            _$TrainerPerFieldToJson.userImg(userImg as String?),
      if (userImgFieldValue != null)
        _$TrainerFieldMap['userImg']!: userImgFieldValue,
      if (certificates != _sentinel)
        _$TrainerFieldMap['certificates']!: _$TrainerPerFieldToJson
            .certificates(certificates as List<Map<dynamic, dynamic>>?),
      if (certificatesFieldValue != null)
        _$TrainerFieldMap['certificates']!: certificatesFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainerDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class TrainerQuery
    implements QueryReference<Trainer, TrainerQuerySnapshot> {
  @override
  TrainerQuery limit(int limit);

  @override
  TrainerQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  TrainerQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereFirstName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereLastName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereMobileNo({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery wherePassword({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereDob({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereCity({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereGender({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereNationality({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereResidence({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereSpecializations({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery whereTrainingService({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery whereImages({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery whereVideos({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery wherePlaylists({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery whereReviews({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery whereProfileComments({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery wherePackages({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  TrainerQuery whereUserImg({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  TrainerQuery whereCertificates({
    List<Map<dynamic, dynamic>>? isEqualTo,
    List<Map<dynamic, dynamic>>? isNotEqualTo,
    List<Map<dynamic, dynamic>>? isLessThan,
    List<Map<dynamic, dynamic>>? isLessThanOrEqualTo,
    List<Map<dynamic, dynamic>>? isGreaterThan,
    List<Map<dynamic, dynamic>>? isGreaterThanOrEqualTo,
    Map<dynamic, dynamic>? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  TrainerQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByMobileNo({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByPassword({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByDob({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByCity({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByGender({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByNationality({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByResidence({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderBySpecializations({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByTrainingService({
    bool descending = false,
    List<Map<dynamic, dynamic>> startAt,
    List<Map<dynamic, dynamic>> startAfter,
    List<Map<dynamic, dynamic>> endAt,
    List<Map<dynamic, dynamic>> endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByImages({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByVideos({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByPlaylists({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByReviews({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByProfileComments({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByPackages({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByUserImg({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });

  TrainerQuery orderByCertificates({
    bool descending = false,
    List<Map<dynamic, dynamic>>? startAt,
    List<Map<dynamic, dynamic>>? startAfter,
    List<Map<dynamic, dynamic>>? endAt,
    List<Map<dynamic, dynamic>>? endBefore,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  });
}

class _$TrainerQuery extends QueryReference<Trainer, TrainerQuerySnapshot>
    implements TrainerQuery {
  _$TrainerQuery(
    this._collection, {
    required Query<Trainer> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<TrainerQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(TrainerQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<TrainerQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(TrainerQuerySnapshot._fromQuerySnapshot);
  }

  @override
  TrainerQuery limit(int limit) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery limitToLast(int limit) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereFirstName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['firstName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.firstName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.firstName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.firstName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.firstName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.firstName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .firstName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.firstName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TrainerPerFieldToJson.firstName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereLastName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['lastName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.lastName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.lastName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.lastName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.lastName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.lastName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.lastName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.lastName(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.lastName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereMobileNo({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<int>? whereIn,
    List<int>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['mobileNo']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.mobileNo(isEqualTo as int)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.mobileNo(isNotEqualTo as int)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.mobileNo(isLessThan as int)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.mobileNo(isLessThanOrEqualTo as int)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.mobileNo(isGreaterThan as int)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.mobileNo(isGreaterThanOrEqualTo as int)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.mobileNo(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.mobileNo(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereEmail({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['email']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.email(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.email(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.email(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.email(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.email(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.email(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.email(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery wherePassword({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['password']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.password(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.password(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.password(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.password(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.password(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.password(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.password(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.password(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereDob({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['dob']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.dob(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.dob(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.dob(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.dob(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.dob(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.dob(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.dob(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.dob(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereCity({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['city']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.city(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.city(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.city(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.city(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.city(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.city(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.city(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.city(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereGender({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['gender']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.gender(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.gender(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.gender(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.gender(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.gender(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.gender(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.gender(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.gender(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereNationality({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['nationality']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.nationality(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.nationality(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.nationality(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.nationality(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.nationality(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .nationality(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.nationality(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TrainerPerFieldToJson.nationality(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereResidence({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['residence']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.residence(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.residence(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.residence(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.residence(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.residence(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .residence(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.residence(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TrainerPerFieldToJson.residence(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['id']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.id(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.id(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.id(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.id(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.id(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.id(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.id(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.id(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereSpecializations({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['specializations']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.specializations(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .specializations(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .specializations(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .specializations(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .specializations(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .specializations(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                    .specializations([arrayContains as String]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.specializations(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereTrainingService({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['trainingService']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .trainingService(isEqualTo as List<Map<dynamic, dynamic>>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .trainingService(isNotEqualTo as List<Map<dynamic, dynamic>>)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .trainingService(isLessThan as List<Map<dynamic, dynamic>>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.trainingService(
                isLessThanOrEqualTo as List<Map<dynamic, dynamic>>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .trainingService(isGreaterThan as List<Map<dynamic, dynamic>>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.trainingService(
                isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson.trainingService(
                    [arrayContains as Map<dynamic, dynamic>]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.trainingService(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereImages({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['images']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .images(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .images(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .images(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .images(isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .images(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .images(isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                    .images([arrayContains as Map<dynamic, dynamic>]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.images(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereVideos({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['videos']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .videos(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .videos(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .videos(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .videos(isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .videos(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .videos(isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                    .videos([arrayContains as Map<dynamic, dynamic>]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.videos(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery wherePlaylists({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['playlists']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .playlists(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .playlists(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .playlists(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .playlists(isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .playlists(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.playlists(
                isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                        .playlists([arrayContains as Map<dynamic, dynamic>])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.playlists(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereReviews({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['reviews']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .reviews(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .reviews(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .reviews(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .reviews(isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .reviews(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .reviews(isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                        .reviews([arrayContains as Map<dynamic, dynamic>])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.reviews(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereProfileComments({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['profileComments']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .profileComments(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .profileComments(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .profileComments(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.profileComments(
                isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .profileComments(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.profileComments(
                isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson.profileComments(
                    [arrayContains as Map<dynamic, dynamic>]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.profileComments(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery wherePackages({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['packages']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .packages(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .packages(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .packages(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson
                .packages(isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .packages(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.packages(
                isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                        .packages([arrayContains as Map<dynamic, dynamic>])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.packages(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereUserImg({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['userImg']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.userImg(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson.userImg(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson.userImg(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.userImg(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson.userImg(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.userImg(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$TrainerPerFieldToJson.userImg(e)),
        whereNotIn: whereNotIn?.map((e) => _$TrainerPerFieldToJson.userImg(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery whereCertificates({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Map<dynamic, dynamic>>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TrainerFieldMap['certificates']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .certificates(isEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$TrainerPerFieldToJson
                .certificates(isNotEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThan: isLessThan != null
            ? _$TrainerPerFieldToJson
                .certificates(isLessThan as List<Map<dynamic, dynamic>>?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.certificates(
                isLessThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TrainerPerFieldToJson
                .certificates(isGreaterThan as List<Map<dynamic, dynamic>>?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TrainerPerFieldToJson.certificates(
                isGreaterThanOrEqualTo as List<Map<dynamic, dynamic>>?)
            : null,
        arrayContains: arrayContains != null
            ? (_$TrainerPerFieldToJson
                        .certificates([arrayContains as Map<dynamic, dynamic>])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$TrainerPerFieldToJson.certificates(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TrainerQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['firstName']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['lastName']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByMobileNo({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['mobileNo']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['email']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByPassword({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['password']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByDob({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['dob']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByCity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['city']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByGender({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['gender']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByNationality({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['nationality']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByResidence({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['residence']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['id']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderBySpecializations({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['specializations']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByTrainingService({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['trainingService']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByImages({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['images']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByVideos({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['videos']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByPlaylists({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['playlists']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByReviews({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['reviews']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByProfileComments({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['profileComments']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByPackages({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['packages']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByUserImg({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TrainerFieldMap['userImg']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  TrainerQuery orderByCertificates({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TrainerDocumentSnapshot? startAtDocument,
    TrainerDocumentSnapshot? endAtDocument,
    TrainerDocumentSnapshot? endBeforeDocument,
    TrainerDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TrainerFieldMap['certificates']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$TrainerQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$TrainerQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TrainerDocumentSnapshot extends FirestoreDocumentSnapshot<Trainer> {
  TrainerDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Trainer> snapshot;

  @override
  TrainerDocumentReference get reference {
    return TrainerDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Trainer? data;
}

class TrainerQuerySnapshot
    extends FirestoreQuerySnapshot<Trainer, TrainerQueryDocumentSnapshot> {
  TrainerQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory TrainerQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Trainer> snapshot,
  ) {
    final docs = snapshot.docs.map(TrainerQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        TrainerDocumentSnapshot._,
      );
    }).toList();

    return TrainerQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<TrainerDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    TrainerDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<TrainerDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Trainer> snapshot;

  @override
  final List<TrainerQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TrainerDocumentSnapshot>> docChanges;
}

class TrainerQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Trainer>
    implements TrainerDocumentSnapshot {
  TrainerQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Trainer> snapshot;

  @override
  final Trainer data;

  @override
  TrainerDocumentReference get reference {
    return TrainerDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      mobileNo: (json['mobileNo'] as num).toInt(),
      email: json['email'] as String,
      password: json['password'] as String,
      dob: json['dob'] as String,
      city: json['city'] as String,
      gender: json['gender'] as String,
      nationality: json['nationality'] as String,
      residence: json['residence'] as String,
      id: json['id'] as String,
      specializations: (json['specializations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      trainingService: (json['trainingService'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      playlists: (json['playlists'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      profileComments: (json['profileComments'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      packages: (json['packages'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      userImg: json['userImg'] as String?,
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

const _$TrainerFieldMap = <String, String>{
  'firstName': 'firstName',
  'lastName': 'lastName',
  'mobileNo': 'mobileNo',
  'email': 'email',
  'password': 'password',
  'dob': 'dob',
  'city': 'city',
  'gender': 'gender',
  'nationality': 'nationality',
  'residence': 'residence',
  'id': 'id',
  'specializations': 'specializations',
  'trainingService': 'trainingService',
  'images': 'images',
  'videos': 'videos',
  'playlists': 'playlists',
  'reviews': 'reviews',
  'profileComments': 'profileComments',
  'packages': 'packages',
  'userImg': 'userImg',
  'certificates': 'certificates',
};

// ignore: unused_element
abstract class _$TrainerPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? mobileNo(int instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? password(String instance) => instance;
  // ignore: unused_element
  static Object? dob(String instance) => instance;
  // ignore: unused_element
  static Object? city(String instance) => instance;
  // ignore: unused_element
  static Object? gender(String instance) => instance;
  // ignore: unused_element
  static Object? nationality(String instance) => instance;
  // ignore: unused_element
  static Object? residence(String instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? specializations(List<String> instance) => instance;
  // ignore: unused_element
  static Object? trainingService(List<Map<dynamic, dynamic>> instance) =>
      instance;
  // ignore: unused_element
  static Object? images(List<Map<dynamic, dynamic>>? instance) => instance;
  // ignore: unused_element
  static Object? videos(List<Map<dynamic, dynamic>>? instance) => instance;
  // ignore: unused_element
  static Object? playlists(List<Map<dynamic, dynamic>>? instance) => instance;
  // ignore: unused_element
  static Object? reviews(List<Map<dynamic, dynamic>>? instance) => instance;
  // ignore: unused_element
  static Object? profileComments(List<Map<dynamic, dynamic>>? instance) =>
      instance;
  // ignore: unused_element
  static Object? packages(List<Map<dynamic, dynamic>>? instance) => instance;
  // ignore: unused_element
  static Object? userImg(String? instance) => instance;
  // ignore: unused_element
  static Object? certificates(List<Map<dynamic, dynamic>>? instance) =>
      instance;
}

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNo': instance.mobileNo,
      'email': instance.email,
      'password': instance.password,
      'dob': instance.dob,
      'city': instance.city,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'residence': instance.residence,
      'id': instance.id,
      'specializations': instance.specializations,
      'trainingService': instance.trainingService,
      'images': instance.images,
      'videos': instance.videos,
      'playlists': instance.playlists,
      'reviews': instance.reviews,
      'profileComments': instance.profileComments,
      'packages': instance.packages,
      'userImg': instance.userImg,
      'certificates': instance.certificates,
    };
