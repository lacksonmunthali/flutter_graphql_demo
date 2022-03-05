String createAccount = """
mutation CreateAccount(
  \$email: String!, 
  \$phoneNumber:String!, 
  \$firstName: String!,
  \$lastName: String!,
  \$password1: String!,
  \$password2: String!,
){
  createAccount(
    email: \$email,
    phoneNumber: \$phoneNumber,
    firstName: \$firstName,
    lastName: \$lastName,
    password1: \$password1,
    password2: \$password2,
  ){
    success
  }
}
""";

String createDriver = """
mutation CreateAccount(
  \$email: String!, 
  \$phoneNumber:String!, 
  \$firstName: String!,
  \$lastName: String!,
  \$password1: String!,
  \$password2: String!,
){
  createAccount(
    email: \$email,
    phoneNumber: \$phoneNumber,
    firstName: \$firstName,
    lastName: \$lastName,
    password1: \$password1,
    password2: \$password2,
  ){
    success
  }
}
""";
