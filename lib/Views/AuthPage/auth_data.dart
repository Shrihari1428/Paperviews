List<String> username = ["Vijay", "varun", "marvel", "fafa"];

List<String> password = ["Vijay@3423", "avengers", "thor", "dododo"];

bool authenticate(){
  for(int i = 0;i<username.length;i++){
    if(username[i]==password[i]) {
      return true;
    }
  }
  return false;
}