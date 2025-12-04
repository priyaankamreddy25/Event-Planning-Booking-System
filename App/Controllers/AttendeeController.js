const Attendee = require("../models/Attendee");

module.exports = {
  async getAttendeesByEvent(req, res) {
    const eventID = req.params.eventID;
    const attendees = await Attendee.getByEvent(eventID);
    res.render("attendees", { eventID, attendees });
  }
};
