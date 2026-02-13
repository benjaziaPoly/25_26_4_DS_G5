class Etudiant {
  //attr+constuct+methode+get/setters
  int _matricule = 0;
  String _nom = "";
  String _groupe = "";
  //getters
  int get matricule => _matricule;
  String get nom => _nom;
  String get groupe => _groupe;
  //setters
  set matricule(int m) => _matricule = m;
  set nom(String m) => _nom = m;
  set groupe(String m) => _groupe = m;
  //
  Etudiant() {
    _matricule = 0;
    _groupe = "";
    _nom = "";
  }
  Etudiant.avecParam(int mat, String n, String g) {
    _matricule = mat;
    _groupe = g;
    _nom = n;
  }
  Etudiant.avecParamOpt(int mat, String n, String g);

  Etudiant.avecParamNomme({
    int mat = 0,
    required String nom,
    required String groupe,
  }) {
    _matricule = mat;
    _groupe = groupe;
    _nom = nom;
  }
}

void main() {
  var e = Etudiant();
  var e1 = Etudiant.avecParam(0, "aa", "aa");
  var e2 = Etudiant.avecParamOpt(0, "aa", "aa");
  var e3 = Etudiant.avecParamNomme(nom: "aa",mat: 10,  groupe: "aa");
}
