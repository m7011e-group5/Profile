const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db.js");

// middleware
app.use(cors());
app.use(express.json());

// CREATE student
app.post("/student", async (req, res) => {
    try {
        console.log("1. POST request received");

        const { display_name } = req.body;
        console.log("2. Received:", display_name);

        const newStudent = await pool.query(
            'INSERT INTO "StudentProfile" (display_name) VALUES ($1) RETURNING *',
            [display_name]
        );

        res.status(201).json(newStudent.rows[0]);

    } catch (err) {
        console.error(err.message);
        res.status(500).json({ error: "Database error" });
    }
});

// GET all students
app.get("/student", async (req, res) => {
    try {
        const allStudents = await pool.query(
            'SELECT * FROM "StudentProfile"'
        );

        res.json(allStudents.rows);

    } catch (err) {
        console.error(err.message);
        res.status(500).json({ error: "Database error" });
    }
});





// CREATE course GET all course
app.post("/course", async (req, res) => {
    try {
        console.log("1. POST request received");

        const { course_name } = req.body;
        console.log("2. Received:", course_name);

        const newCourse = await pool.query(
            'INSERT INTO "Course" (course_name) VALUES ($1) RETURNING *',
            [course_name]
        );

        res.status(201).json(newCourse.rows[0]);

    } catch (err) {
        console.error(err.message);
        res.status(500).json({ error: "Database error" });
    }
});

app.get("/course", async (req, res) => {
    try {
        const allStudents = await pool.query(
            'SELECT * FROM "Course"'
        );

        res.json(allStudents.rows);

    } catch (err) {
        console.error(err.message);
        res.status(500).json({ error: "Database error" });
    }
});















app.listen(5000, () => {
    console.log("server has started on port 5000");
});