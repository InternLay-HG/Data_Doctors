import React, { useState, useEffect, useRef } from "react";
import Constants from "../constants/CommunitySample";
import NoResult from "../assets/NoResults.png";
import {
  Send as SendIcon,
  Search as SearchIcon,
  Close as CloseIcon,
} from "@mui/icons-material";
import AddPhotoAlternateIcon from "@mui/icons-material/AddPhotoAlternate";
import CommunityPost from "../ui/Community/CommunityPost";
//important colors

const srcollBarColor = "#003060";
const sendButtonColor = "rgba(29, 78, 216, 0.8)";
const sendButtonColorHover = "#1d4ed8";
const AskQueBarColor = "rgba(100, 149, 237, 0.1)";
const inputBoxColor = "rgba(255,255,255)";
const CommunityBackgroundColor = "rgba(138, 199, 219, 0.2)";
const SearchButtonColor = "#1E5162";

//temp data
const CommunityPosts = Constants.CommunityPosts;
//CommunitySupport Component
const CommunitySupport = () => {
  // useEffect(() => {
  //   //API call to get community posts
  // }, []);

  //Search Functionality
  const [filteredPosts, setFilteredPosts] = useState(CommunityPosts);
  const [isExpanded, setIsExpanded] = useState(false);
  const [SearchInput, setSearchInput] = useState("");

  const handleExpandSearch = (e) => {
    e.preventDefault();
    setIsExpanded((prev) => {
      return !prev;
    });
    setFilteredPosts(CommunityPosts);
  };
  const handleSearchFilter = (e) => {
    e.preventDefault();
    const query = e.target.query.value.toLowerCase();
    const filtered = CommunityPosts.filter((post) =>
      post.post.message.toLowerCase().includes(query)
    );
    setFilteredPosts(filtered);
  };

  //post form inputs handlers
  const [SelectedImage, setSelectedImage] = useState(null);
  const [NewPostMessage, setNewPostMessage] = useState("");
  const fileInputRef = useRef(null);
  const handleIconClick = () => {
    fileInputRef.current.click();
  };

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    if (file) {
      setSelectedImage(file);
    }
  };
  const removeSelectedImage = () => {
    setSelectedImage(null);
    fileInputRef.current.value = null;
  };
  const NewCommunityPostSubmitHandler = (e) => {
    e.preventDefault();
    console.log({
      message: NewPostMessage,
      image: SelectedImage,
    });
  };
  return (
    <>
      <style>
        {`
          .scroll-component {
             overflow-y: auto;
             height: 60rem;
             padding-left: 1rem;
             padding-top: 1rem;
             position: relative;
           }
          .scroll-component::-webkit-scrollbar {
             width: 0.5rem;
           }
          .scroll-component::-webkit-scrollbar-track {
             background: rbga(0,0,0,0.1);
           }
          .scroll-component::-webkit-scrollbar-thumb {
             background-color: ${srcollBarColor};
             border-radius: 10px;
           }
          .send-body {
            width: 10rem;
            border-radius: 1rem;
            background: ${sendButtonColor};
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0.5rem 0rem;
            margin-right: 1rem;
            border:1px solid white;
            outline: none;
            cursor: pointer;
            transition: background 0.3s ease; /* Smooth transition */
          }
          .send-body:hover {
            background: ${sendButtonColorHover} !important; /* Darker shade on hover */
          }
        `}
      </style>
      <div style={{ background: CommunityBackgroundColor, cursor: "default" }}>
        {
          //Community Posts
        }
        <div className="scroll-component">
          <div
            style={{
              display: "flex",
              alignItems: "center",
              justifyContent: "space-between",
              marginRight: "4rem",
            }}
          >
            <div
              style={{
                fontWeight: "bolder",
                fontSize: "3.3rem",
                marginBottom: "2rem",
                marginLeft:"1rem",
                marginTop:"1rem"
              }}
            >
              Top Community Posts
            </div>
            <form
              action="/search"
              onSubmit={handleSearchFilter}
              style={{
                display: "flex",
                alignItems: "center",
                position: "relative",
              }}
            >
              <input
                type="text"
                name="query"
                placeholder="Search..."
                style={{
                  color: "black",
                  fontFamily: "Space Mono",
                  padding: "1rem 2rem",
                  borderRadius: "2rem",
                  border: "3px solid gray",
                  outline: "none",
                  width: isExpanded ? "min(30vw, 40rem)" : "0",
                  opacity: isExpanded ? "1" : "0",
                  position: isExpanded ? "absolute" : "static",
                  top: 0,
                  zIndex: "10",
                  right: "6rem",
                  transition: "width 0.3s ease, opacity 0.3s ease",
                  marginRight: isExpanded ? "1rem" : "0",
                }}
                onChange={(e) => setSearchInput(e.target.value)}
                required={isExpanded}
              />
              <button
                type={
                  isExpanded && SearchInput.length !== 0 ? "submit" : "button"
                }
                onClick={
                  isExpanded && SearchInput.length !== 0
                    ? undefined
                    : handleExpandSearch
                }
                style={{
                  padding: "0.5rem",
                  borderRadius: "50%",
                  background: SearchButtonColor,
                  cursor: "pointer",
                  border: "1px solid white",
                }}
              >
                <SearchIcon
                  style={{ width: "3.5rem", height: "3.5rem", color: "white" }}
                />
              </button>
            </form>
          </div>
          {filteredPosts.length !== 0 ? (
            <div style={{ margin: "0rem 3rem" }}>
              {filteredPosts.map((post, index) => (
                <CommunityPost key={index} post={post} />
              ))}
            </div>
          ) : (
            <div
              style={{
                width: "100%",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                height: "70%",
                flexDirection: "column",
              }}
            >
              <img
                src={NoResult}
                alt="No Results"
                style={{ width: "40rem", marginTop: "1rem" }}
              />
              <div
                style={{
                  fontSize: "2rem",
                  textAlign: "center",
                  paddingRight: "4rem",
                  fontFamily: "Space Mono",
                  fontWeight: "bold",
                  color: "#1E5162",
                }}
              >
                No result Found
              </div>
            </div>
          )}
          {SelectedImage && (
            <div
              style={{
                margin: "1rem",
                position: "sticky",
                bottom: 10,
                display: "flex",
              }}
            >
              <div
                style={{
                  padding: "1rem",
                  background: "rgba(0,0,0,0.4)",
                  width: "fit-content",
                  borderRadius: "1rem",
                  overflow: "hidden",
                }}
              >
                <img
                  src={URL.createObjectURL(SelectedImage)}
                  alt="Selected preview"
                  width="140px"
                  height="140px"
                  style={{ borderRadius: "5px", marginTop: "1rem" }}
                />
              </div>
              <div
                style={{
                  background: "rgba(0,0,0,0.7)",
                  display: "flex",
                  alignItems: "center",
                  height: "fit-content",
                  marginLeft: "0.3rem",
                  borderRadius: "0.6rem",
                  cursor: "pointer",
                }}
                onClick={removeSelectedImage}
              >
                <CloseIcon
                  style={{ width: "2rem", height: "2rem", color: "white" }}
                />
              </div>
            </div>
          )}
        </div>
        {
          //Ask  Bar
        }

        <form
          onSubmit={NewCommunityPostSubmitHandler}
          style={{
            width: "100%",
            background: AskQueBarColor,
            display: "flex",
            alignItems: "center",
            gap: "3rem",
            paddingTop: "0.5rem",
          }}
        >
          <div
            style={{
              borderRadius: "50%",
              background: inputBoxColor,
              padding: "0.5rem",
              marginLeft: "1rem",
              cursor: "pointer",
            }}
            onClick={handleIconClick}
          >
            <AddPhotoAlternateIcon
              style={{ width: "3.5rem", height: "3.5rem" }}
            />
            <input
              type="file"
              ref={fileInputRef}
              style={{ display: "none" }}
              onChange={handleFileChange}
              accept=".jpeg, .jpg, .png"
            />
          </div>
          <input
            type="text"
            placeholder="Ask your question here..."
            style={{
              color: "black",
              fontFamily: "Space Mono",
              width: "100%",
              maxWidth: "80rem",
              padding: "1rem 2rem",
              margin: "1rem 0",
              borderRadius: "3rem",
              border: "1px solid gray",
              backgroundColor: inputBoxColor,
              backdropFilter: "blur(10px)",
              marginRight: "3rem",
            }}
            required
            onChange={(e) => setNewPostMessage(e.target.value)}
          />
          <button className="send-body" type="submit">
            <SendIcon
              className="send-Icon"
              style={{ width: "3.5rem", height: "3.5rem", color: "white" }}
            />
          </button>
        </form>
      </div>
    </>
  );
};
export default CommunitySupport;
