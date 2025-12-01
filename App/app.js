const express = require("express");
const path = require("path");

const eventRoutes = require("./routes/eventRoutes");
const attendeeRoutes = require("./routes/attendeeRoutes");
const organizerRoutes = require("./routes/organizerRoutes");

const app = express();

app.use(express.static("static"));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "pug");

app.use("/", eventRoutes);
app.use("/", attendeeRoutes);
app.use("/", organizerRoutes);

app.listen(3000, () => {
    console.log("Server running → http://127.0.0.1:3000/");
});

module.exports = app;
