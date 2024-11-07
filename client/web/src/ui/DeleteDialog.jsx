import React from 'react'

const DeleteDialog = ({IsDialogOpen,DeleteDialogRef,closeDialog,handler}) => {
  return (
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
                onClick={handler}
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
  )
}

export default DeleteDialog