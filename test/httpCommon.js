import Axios from "axios";
const instance = Axios.create({
  baseURL: "http://localhost:8000/",
});
export default instance;
