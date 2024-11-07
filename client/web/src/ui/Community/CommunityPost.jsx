import React,{useState,useRef,useEffect} from 'react'
import moment from "moment";
import {
    Send as SendIcon,
    ArrowCircleUp,
    ArrowCircleDown,
    DeleteForever as DeleteIcon,
  } from "@mui/icons-material";
import DeleteDialog from "../DeleteDialog";
import ReplyComponent from './ReplyComponent';
const PostColor = "rgba(255,255,255)";
const userId = 1;

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
    const handleDeletePost = () => {
      setIsDialogOpen(false);
      console.log(`Post Deleted with id ${post._id}`);
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
    useEffect(() => {
        if(post.upvotes.includes(userId)){
            setUpvoted(true);
        }
    }, []);
    const handleUpvote = () => {
      setUpvoted((prev) => !prev);
      console.log(`Post Upvoted with id ${post._id}`);
      //API call to upvote post
    };
    return (
      <div className="post">
        <DeleteDialog IsDialogOpen={IsDialogOpen} DeleteDialogRef={DeleteDialogRef} closeDialog={closeDialog} handler={handleDeletePost}/>
        <div
          style={{
            background: PostColor,
            width: "min(100%,80rem)",
            borderRadius: "1rem",
            padding: "1rem",
            marginBottom: "1rem",
            border: "1px solid grey",
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
                  fontWeight: "bolder",
                  fontFamily: "Space Mono",
                  fontSize: "1.9rem",
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
            <div style={{ fontFamily: "Space Mono",fontSize:"1.8rem" ,color:"black"}}>{post.post.message}</div>
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
                <div>{post.upvotes.length}</div>
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
                  background: "rgba(0,0,0,0.3)",
                }}
                type="submit"
              >
                <SendIcon
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
  export default CommunityPost;
  //ReplyComponent
 