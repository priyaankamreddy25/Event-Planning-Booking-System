const Organizer = require("../models/Organizer");

module.exports = {
  async getOrganizerEvents(req, res) {
    const id = req.params.id;
    const { organizer_name, events } = await Organizer.getEvents(id);
    res.render("organizer", { organizer_name, events });
  }
};
