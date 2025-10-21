const express = require("express");
const app = express();
const PORT = 5000;

app.get("/api/message", (req, res) => {
  res.json({ message: "Hello from the backend!" });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Backend running on port ${PORT}`);
});