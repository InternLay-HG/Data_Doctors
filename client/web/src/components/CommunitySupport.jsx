import React, { useState, useEffect, useRef } from "react";
import Constants from "../constants/CommunitySample";
import NoResult from "../assets/NoResults.png";
import moment from "moment";
import {
  Send as SendIcon,
  Search as SearchIcon,
  ArrowCircleUp,
  ArrowCircleDown,
  Edit as EditIcon,
  Close as CloseIcon,
  DeleteForever as DeleteIcon,
} from "@mui/icons-material";
import AddPhotoAlternateIcon from "@mui/icons-material/AddPhotoAlternate";

//important colors
const PostColor = "rgba(255,255,255)";
const ReplyColor = "rgba(255,255,255,0.8)";
const srcollBarColor = "#003060";
const sendButtonColor = "#0E86D4";
const sendButtonColorHover = "#0071c5";
const AskQueBarColor = "rgba(100, 149, 237, 0.5)";
const inputBoxColor = "rgba(255,255,255,0.9)";
const CommunityBackgroundColor = "#8AC7DB";
const SearchButtonColor = "#1E5162";

//temp data
const CommunityPosts = Constants.CommunityPosts;
const userId = 1;
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
                fontSize: "4rem",
                color: "#1E5162",
                fontFamily: "Space Mono",
                marginBottom: "2rem",
                textDecoration: "underline",
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
                  border: "1px solid gray",
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
                  color: "black",
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

//CommunityPost Component
const CommunityPost = ({ post }) => {
  //Edit and Delete Dialogs
  const [IsDialogOpen, setIsDialogOpen] = useState(false);
  const DeleteDialogRef = useRef(null);
  const closeDialog = () => {
    DeleteDialogRef.current.close();
    setIsDialogOpen(false);
  };
  const openDeleteDialog = () => {
    DeleteDialogRef.current.showModal();
    setIsDialogOpen(true);
  };
  const handleDletePost = (id) => {
    setIsDialogOpen(false);
    console.log(`Post Deleted with id ${id}`);
    //API call to delete post
  };
  //REPLY SECTION
  const [ShowReply, setShowReply] = useState(false);
  const [EnableReply, setEnableReply] = useState(false);
  const [ReplyMessage, setReplyMessage] = useState("");
  const toggleReply = () => {
    setShowReply((prev) => !prev);
  };
  const handleReply = () => {
    setEnableReply((prev) => !prev);
  };
  const handleReplySubmit = (e, id) => {
    e.preventDefault();
    console.log(`ReplyMessage on id ${id}`, ReplyMessage);
    //API call to post reply
  };

  //UPVOTE SECTION
  const [Upvoted, setUpvoted] = useState(false);
  const handleUpvote = () => {
    setUpvoted((prev) => !prev);
    console.log(`Post Upvoted with id ${post._id}`);
    //API call to upvote post
  };
  return (
    <div className="post">
      <div style={{ position: "relative", width: "100%", height: "100%" }}>
        <div
          style={{
            display: IsDialogOpen ? "block" : "none",
            position: "fixed",
            top: 0,
            left: 0,
            width: "100%",
            height: "100%",
            backgroundColor: "rgba(0, 0, 0, 0.5)",
            zIndex: 1,
          }}
        />
        <dialog
          ref={DeleteDialogRef}
          style={{
            position: "absolute",
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            padding: "20px",
            border: "none",
            borderRadius: "2rem",
            backgroundColor: "rgba(255, 255, 255, 1)",
            boxShadow: "0 4px 8px rgba(0, 0, 0, 0.2)",
            zIndex: 2,
          }}
        >
          <form
            method="dialog"
            style={{
              width: "26rem",
              height: "12rem",
              display: "flex",
              flexDirection: "column",
              justifyContent: "space-between",
              margin: "0.5rem",
            }}
          >
            <div>Are you sure you want to delete it permanently?</div>
            <div
              style={{
                display: "flex",
                justifyContent: "flex-end",
                gap: "1rem",
              }}
            >
              <button
                type="button"
                onClick={closeDialog}
                style={{
                  padding: "0.6rem",
                  borderRadius: "1rem",
                  border: "2px solid #5bc0de",
                }}
              >
                Cancel
              </button>
              <button
                type="submit"
                onClick={() => {
                  handleDletePost(post._id);
                }}
                style={{
                  padding: "0.6rem 1rem",
                  borderRadius: "1rem",
                  background: "#d9534f",
                  color: "white",
                }}
              >
                Delete
              </button>
            </div>
          </form>
        </dialog>
      </div>
      <div
        style={{
          background: PostColor,
          width: "min(100%,80rem)",
          borderRadius: "0.7rem",
          padding: "1rem",
          marginBottom: "1rem",
        }}
      >
        <div
          style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: "2rem",
              margin: "1.5rem 0.5rem",
            }}
          >
            <img
              src={post.pfp}
              alt="pfp"
              style={{
                borderRadius: "50%",
                border: "1px solid black",
                width: "4.2rem",
              }}
            />
            <span
              style={{
                color: "black",
                fontWeight: "bold",
                fontFamily: "monospace",
                fontSize: "1.85rem",
              }}
            >
              {post.user_name}
            </span>
          </div>
          <div
            style={{
              display: userId === post.user_id ? "flex" : "none",
              alignItems: "center",
              // gap: "2rem",
              marginRight: "1rem",
            }}
          >
            {/* <EditIcon
              style={{ width: "1.7rem", height: "1.7rem", cursor: "pointer" }}
            /> */}
            <DeleteIcon
              style={{ width: "2rem", height: "2rem", cursor: "pointer" }}
              onClick={openDeleteDialog}
            />
          </div>
        </div>
        <div style={{ marginBottom: "2rem" }}>
          <div style={{ fontFamily: "Space Mono" }}>{post.post.message}</div>
          {post.post.image && (
            <img
              src={post.post.image}
              alt=""
              style={{
                width: "20rem",
              }}
            />
          )}
        </div>
        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "space-between",
            fontWeight: "bold",
          }}
        >
          <div
            style={{
              display: "flex",
              alignItems: "center",
              gap: "3rem",
            }}
          >
            <div
              style={{
                display: "flex",
                alignItems: "center",
                gap: "0.5rem",
                height: "3rem",
              }}
              onClick={handleUpvote}
            >
              <div>{post.upvotes}</div>
              <div>
                {Upvoted ? (
                  <ArrowCircleDown
                    style={{ width: "2rem", height: "2rem", cursor: "pointer" }}
                  />
                ) : (
                  <ArrowCircleUp
                    style={{ width: "2rem", height: "2rem", cursor: "pointer" }}
                  />
                )}
              </div>
            </div>
            <div style={{ cursor: "pointer" }}>
              <span
                style={{ fontFamily: "Space Mono", fontSize: "1.4rem" }}
                onClick={toggleReply}
              >
                REPLIES
              </span>
              <span onClick={toggleReply}>{ShowReply ? "▲" : "▼"}</span>
            </div>
            <span
              style={{ fontFamily: "Space Mono", fontSize: "1.4rem" }}
              onClick={handleReply}
            >
              REPLY
            </span>
          </div>
          <div
            style={{
              fontSize: "1.5rem",
              color: "grey",
              paddingLeft: "4rem",
            }}
          >
            {moment(`${post.createdAt}`).fromNow()}
          </div>
        </div>
      </div>
      {EnableReply && (
        <div style={{ marginLeft: "4rem" }}>
          <form
            style={{
              width: "100%",
              display: "flex",
              alignItems: "center",
              gap: "1rem",
              marginBottom: "1rem",
            }}
            onSubmit={(e) => {
              handleReplySubmit(e, post._id);
            }}
          >
            <input
              type="text"
              placeholder="Reply here..."
              style={{
                color: "black",
                fontFamily: "Space Mono",
                width: "100%",
                maxWidth: "60rem",
                padding: "1rem 2rem",
                borderRadius: "1rem",
                border: "1px solid gray",
              }}
              onChange={(e) => setReplyMessage(e.target.value)}
              required
            />
            <button
              style={{
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                padding: "0.5rem",
                borderRadius: "1rem",
                background: "rgba(0,0,0,0.1)",
              }}
              type="submit"
            >
              <SendIcon
                className="send-Icon"
                style={{ width: "3.5rem", height: "3.5rem", color: "white" }}
              />
            </button>
          </form>
        </div>
      )}
      {ShowReply && (
        <div style={{ marginLeft: "4rem" }}>
          {post.replies.map((reply, index) => (
            <ReplyComponent key={index} reply={reply} postId={post._id} />
          ))}
        </div>
      )}
    </div>
  );
};

//ReplyComponent
const ReplyComponent = ({ reply, postId }) => {
  const [IsDialogOpen, setIsDialogOpen] = useState(false);
  const DeleteDialogRef = useRef(null);
  const closeDialog = () => {
    DeleteDialogRef.current.close();
    setIsDialogOpen(false);
  };
  const openDeleteDialog = () => {
    DeleteDialogRef.current.showModal();
    setIsDialogOpen(true);
  };
  const handleDeleteReply = (id) => {
    setIsDialogOpen(false);
    console.log(`reply Deleted with id ${id} of post id ${postId}`);
    //API call to delete reply under a post
  };

  //UPVOTE SECTION
  const [Upvoted, setUpvoted] = useState(false);
  const handleUpvote = () => {
    setUpvoted((prev) => !prev);
    console.log(`Post Upvoted with id ${reply._id} under ${postId}`);
    //API call to upvote post
  };
  return (
    <div
      style={{
        background: ReplyColor,
        width: "min(95%,80rem)",
        borderRadius: "0.7rem",
        padding: "0.5rem",
        marginBottom: "1rem",
      }}
    >
      <div style={{ position: "relative", width: "100%", height: "100%" }}>
        <div
          style={{
            display: IsDialogOpen ? "block" : "none",
            position: "fixed",
            top: 0,
            left: 0,
            width: "100%",
            height: "100%",
            backgroundColor: "rgba(0, 0, 0, 0.5)",
            zIndex: 1,
          }}
        />
        <dialog
          ref={DeleteDialogRef}
          style={{
            position: "absolute",
            top: "50%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            padding: "20px",
            border: "none",
            borderRadius: "2rem",
            backgroundColor: "rgba(255, 255, 255, 1)",
            boxShadow: "0 4px 8px rgba(0, 0, 0, 0.2)",
            zIndex: 2,
          }}
        >
          <form
            method="dialog"
            style={{
              width: "26rem",
              height: "12rem",
              display: "flex",
              flexDirection: "column",
              justifyContent: "space-between",
              margin: "0.5rem",
            }}
          >
            <div>Are you sure you want to delete it permanently?</div>
            <div
              style={{
                display: "flex",
                justifyContent: "flex-end",
                gap: "1rem",
              }}
            >
              <button
                type="button"
                onClick={closeDialog}
                style={{
                  padding: "0.6rem",
                  borderRadius: "1rem",
                  border: "2px solid #5bc0de",
                }}
              >
                Cancel
              </button>
              <button
                type="submit"
                onClick={() => {
                  handleDeleteReply(reply._id);
                }}
                style={{
                  padding: "0.6rem 1rem",
                  borderRadius: "1rem",
                  background: "#d9534f",
                  color: "white",
                }}
              >
                Delete
              </button>
            </div>
          </form>
        </dialog>
      </div>

      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "center",
            gap: "2rem",
            margin: "1rem 0.5rem",
          }}
        >
          <img
            src={reply.pfp}
            alt="pfp"
            style={{
              borderRadius: "50%",
              border: "1px solid black",
              width: "2.7rem",
            }}
          />
          <span
            style={{
              color: "black",
              fontWeight: "bold",
              fontFamily: "monospace",
              fontSize: "1.4rem",
            }}
          >
            {reply.user_name}
          </span>
        </div>
        <div
          style={{
            display: userId === reply.user_id ? "flex" : "none",
            alignItems: "center",
            // gap: "2rem",
            marginRight: "1rem",
          }}
        >
          {/* <EditIcon
              style={{ width: "1.7rem", height: "1.7rem", cursor: "pointer" }}
            /> */}
          <DeleteIcon
            style={{ width: "2rem", height: "2rem", cursor: "pointer" }}
            onClick={openDeleteDialog}
          />
        </div>
      </div>

      <div
        style={{
          marginBottom: "1rem",
          marginLeft: "2rem",
          fontFamily: "Space Mono",
        }}
      >
        {reply.message}
      </div>
      <div
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "center",
            gap: "0.5rem",
            height: "3rem",
            marginLeft: "0.5rem",
          }}
          onClick={handleUpvote}
        >
          <div>{reply.upvotes}</div>
          <div>
            {Upvoted ? (
              <ArrowCircleDown
                style={{ width: "2rem", height: "2rem", cursor: "pointer" }}
              />
            ) : (
              <ArrowCircleUp
                style={{ width: "2rem", height: "2rem", cursor: "pointer" }}
              />
            )}
          </div>
        </div>
        <div
          style={{
            fontSize: "1.5rem",
            color: "grey",
            paddingLeft: "4rem",
          }}
        >
          {moment(`${reply.createdAt}`).fromNow()}
        </div>
      </div>
    </div>
  );
};
export default CommunitySupport;
