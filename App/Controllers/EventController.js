const Event = require("../models/Event");
const Attendee = require("../models/Attendee");

module.exports = {
  async getAllEvents(req, res) {
    const events = await Event.getAll();
    res.render("events", { events });
  },

  async getEventAttendees(req, res) {
    const eventID = req.params.id;
    const attendees = await Attendee.getByEvent(eventID);
    res.render("attendees", { eventID, attendees });
  }
};
