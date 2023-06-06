import { useEffect, useState } from "react";
import * as xlsx from "xlsx";
import { Modal } from "@mui/material";
import CheckIcon from "@mui/icons-material/Check";
import CloseIcon from "@mui/icons-material/Close";
import axios from "axios";
import { Form } from "react-bootstrap";
import Dropdown from "react-bootstrap/Dropdown";

function AddBook() {
  function findDuplicateObjects(DB, jsonArray) {
    console.log(jsonArray.length);
    const DBSet = new Set(DB.map((obj) => JSON.stringify(obj.book_ISBN)));
    const duplicates = [];
    const unique = [];

    jsonArray.forEach((obj) => {
      const objString = JSON.stringify(obj.ISBN);

      if (DBSet.has(objString)) {
        duplicates.push(obj);
      } else {
        unique.push(obj);
      }
    });

    return { duplicates, unique };
  }

  const [booksData, setBooksData] = useState([]);
  const [dupBook, setDupBook] = useState([]);
  const [open, setOpen] = useState(false);

  const [selectedSupplierName, setSelectedSupplierName] = useState("");
  const [selectedFile, setSelectedFile] = useState(null);

  const handleFileChange = (event) => {
    setSelectedFile(event.target.files[0]);
  };

  const fetchBooksBySupplier = async (supplier_name) => {
    const res = await axios.get(
      "http://localhost:3000/book/supplier/" + supplier_name
    );
    return res.data;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append("excel_file", selectedFile);
    let json = [];
    if (selectedFile) {
      try {
        const res = await axios.post(
          "http://localhost:3000/book/excel",
          formData
        );
        json = JSON.parse(res.data);
        const DB = await fetchBooksBySupplier(selectedSupplierName);
        if (DB) {
          console.log("DB ", DB);
          const { duplicates, unique } = findDuplicateObjects(DB, json);
          setDupBook(duplicates);
          setBooksData(unique);
          for (let i = 0; i < json.length; i++) {
            json[i]["supplier_name"] = selectedSupplierName;
          }
          console.log(booksData, unique);

          if (dupBook) setOpen(true);
        }
      } catch (err) {
        console.log(err);
      }
    }
  };

  const addList = (book) => {
    setBooksData((prevState) => [...prevState, book]);
    setDupBook((prev) => prev.filter((obj) => obj.ISBN !== book.ISBN));
  };
  const removeList = (ISBN) => {
    setDupBook((prev) => prev.filter((obj) => obj.ISBN !== ISBN));
  };
  const handleClose = () => {
    setOpen(false);
  };

  const addToDB = () => {
    const data = booksData;
    console.log(data);
    axios
      .post("http://localhost:3000/book/add", data)
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <>
      <form onSubmit={handleSubmit}>
        <Form.Select
          aria-label="Default select example"
          onChange={(e) => setSelectedSupplierName(e.target.value)}
        >
          <option>Open this select menu</option>
          <option value="อมรินทร์">อมรินทร์</option>
          <option value="SE-ED">SE-ED</option>
          <option value="เคล็ดไทย">เคล็ดไทย</option>
        </Form.Select>
        <label htmlFor="upload">Upload File</label>
        <input
          type="file"
          name="upload"
          id="upload"
          onChange={handleFileChange}
        />

        <button type="submit">Upload</button>
      </form>

      <h1>List of Book</h1>
      {booksData?.map((i) => {
        return <h3 key={i.ISBN}>Name: {JSON.stringify(i.title)}</h3>;
      })}
      <button onClick={addToDB}>Add</button>
      {dupBook.length > 0 && (
        <Modal open={open} onClose={handleClose}>
          <div
            style={{
              position: "absolute",
              top: "50%",
              left: "50%",
              transform: "translate(-50%, -50%)",
              width: 400,
              backgroundColor: "white",
              padding: 20,
            }}
          >
            <h6>Modal Content</h6>
            <ul>
              {dupBook.map((book) => (
                <div key={book.ISBN}>
                  <li>{JSON.stringify(book)}</li>
                  <CheckIcon
                    className="border-2 text-green-500 cursor-pointer"
                    onClick={() => addList(book)}
                  />
                  <CloseIcon
                    className="border-2 text-red-500 cursor-pointer"
                    onClick={() => removeList(book.ISBN)}
                  />
                </div>
              ))}
            </ul>
            <button onClick={handleClose}>Reject All</button>
          </div>
        </Modal>
      )}
    </>
  );
}

export default AddBook;
