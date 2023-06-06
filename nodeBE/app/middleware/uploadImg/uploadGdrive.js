const { google } = require("googleapis");
const stream = require("stream");
const fs = require("fs");

const keyFile =
  "/Users/ASUS/Desktop/practice/nodeBE/app/assets/googleapis/booktree_google_service_acc.json";
const credentials = JSON.parse(fs.readFileSync(keyFile));

const auth = new google.auth.JWT({
  email: credentials.client_email,
  key: credentials.private_key,
  scopes: ["https://www.googleapis.com/auth/drive.file"],
});
const drive = google.drive({
  version: "v3",
  auth,
});

const uploadGdrive = async (req, res) => {
  try {
    const { buffer } = req.file;
    const extention = req.file.mimetype.split("/")[1];
    const filename = `${req.body.ISBN}.${extention}`;
    const folderId = "1HM5RCLiCoW4tHLeP5jfNrlWm4phxYt3w";

    const readableStream = new stream.PassThrough();
    readableStream.end(buffer);

    // Upload the file to Google Drive
    const response = await drive.files.create({
      requestBody: {
        name: filename,
        mimeType: req.file.mimetype,
        parents: [folderId],
      },
      media: {
        mimeType: req.file.mimetype,
        body: readableStream,
      },
    });

    // Get the file ID and URL
    const fileId = response.data.id;
    const fileUrl = `https://drive.google.com/uc?id=${fileId}`;
    return fileUrl;
  } catch (err) {
    res.status(500).send({
      message: "Could not upload the file: " + err,
    });
  }
};

module.exports = { uploadGdrive };
