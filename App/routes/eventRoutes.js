const express = require("express");
const router = express.Router();
const EventController = require("../controllers/EventController");

router.get("/events", EventController.getAllEvents);
router.get("/event/:id/attendees", EventController.getEventAttendees);

module.exports = router;
