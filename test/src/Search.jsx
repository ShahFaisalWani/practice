import Fuse from "fuse.js";

const DB = [
  {
    ISBN: "9786162875809",
    name: "คู่มือตั้งต้นสำหรับคนทำงาน ที่ไม่อยากฯ",
    desc: "ada",
    author: "Cal Newport",
    publisher: "วีเลิร์น (WeLearn)",
    genre: "จิตวิทยา การพัฒนาตนเอง",
    price: 260,
    condition: "BK01",
  },
  {
    ISBN: "9786163886613",
    name: "ความรักของเยน แอร์ (ปกแข็ง)",
    desc: "การนำเอาตัวอย่งเรื่องรัฐสวัสดิการจากประเทศตะวันตกมาเรียบเรียง บอกเล่าให้เห็นพัฒนาการว่า ประเทศใดสร้างระบบสวัสดิการประเภทอะไรขึ้นมา แก้ไขบรรเทาความทุกข์ยากของประชาชนอย่างไร ทำให้หนังสือเล่มนี้เหมาะสำหรับคนทั่วไปที่สนใจเรื่องสวัสดิการสังคม (Social welfare) และเป็นการสะกิดให้กลุ่มคนที่เคลื่อนไหวเรียกร้องให้มี 'รัฐสวัสดิการ ได้คิดว่า 'รัฐสวัสดิการ' ที่เรียกร้องนั้น มันเป็นประเภทใด เป็นประเภทที่ในทางวิชาการเรียกว่า Welfare state, Welfare society หรือเป็นเพียง Welfare bystate",
    author: "Charlotte Bronte",
    publisher: "สำนักพิมพ์แสงดาว",
    genre: "วรรณกรรมแปล สะท้อนชีวิตและสังคม",
    price: "680",
    condition: "BK02",
  },
];

const fuse = new Fuse(DB, {
  keys: ["name", "author", "desc", "price", "condition"],
});

function Search() {
  const onSubmit = (e) => {
    const search = e.target.value;
    fuse
      .search(search)
      .map((book) => console.log(book.item.ISBN, book.item.author));
  };
  return (
    <>
      <form>
        <input
          type="text"
          name="search"
          placeholder="search"
          onChange={onSubmit}
        />
      </form>
    </>
  );
}

export default Search;
