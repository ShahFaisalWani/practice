import { useState, useEffect } from "react";
import "./App.css";
import { useQuery } from "react-query";
import axios from "axios";
// 3. Now search!

function App() {
  const fetchBooks = async (limit) => {
    const res = await axios.get(
      `http://localhost:3000/book/page?limit=${limit}`
    );
    return res.data;
  };
  const [limit, setLimit] = useState(3);

  const { data, isLoading, isError } = useQuery(["posts", limit], () =>
    fetchBooks(limit)
  );

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (isError) {
    return <div>Error occurred while fetching books.</div>;
  }

  return (
    <div>
      {data?.map((book) => (
        <div key={book.ISBN}>{`${book.ISBN}. ${book.title}`}</div>
      ))}
      <button
        onClick={() => {
          setLimit((prev) => prev + 3);
        }}
      >
        Load More
      </button>
    </div>
  );
}

export default App;
