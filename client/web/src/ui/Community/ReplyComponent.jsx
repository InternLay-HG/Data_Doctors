import React,{useState,useRef, useEffect} from 'react'
import moment from "moment";
import {
    ArrowCircleUp,
    ArrowCircleDown,
    DeleteForever as DeleteIcon,
  } from "@mui/icons-material";
import DeleteDialog from "../DeleteDialog";
const ReplyColor = "rgba(255,255,255,0.8)";
const userId = 1;

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
    const handleDeleteReply = () => {
      setIsDialogOpen(false);
      console.log(`reply Deleted with id ${reply._id} of post id ${postId}`);
      //API call to delete reply under a post
    };
  
    //UPVOTE SECTION
    const [Upvoted, setUpvoted] = useState(false);
    useEffect(() => {
        if(reply.upvotes.includes(userId)){
            setUpvoted(true);
        }
    }, []);
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
          borderRadius: "1rem",
          padding: "0.5rem",
          marginBottom: "1rem",
          border: "1px solid grey",
        }}
      >
        <DeleteDialog IsDialogOpen={IsDialogOpen} DeleteDialogRef={DeleteDialogRef} closeDialog={closeDialog} handler={handleDeleteReply}/>
  
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
              style={{ width: "2rem", height: "2rem", cursor: "pointer"}}
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
            <div>{reply.upvotes.length}</div>
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
  export default ReplyComponent;
  