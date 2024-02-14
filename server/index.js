//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//import 'package:express/express.dart'
//INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://Jasmin:FlutterAmazonClone@cluster0.gnnglxz.mongodb.net/test?retryWrites=true&w=majority";

//middleware
//CLIENT -> SERVER -> CLIENT
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
