import DoctorPng1 from "../assets/DoctorPng1.png";
const CommunityPosts = [
  {
    _id: 1000,
    user_id: 1,
    user_name: "Kartik Bhai",
    pfp: "https://www.w3schools.com/howto/img_avatar.png",
    post: {
      message: "Hello can you suggest me some home medications for fever?",
      image: null,
    },
    replies: [
      {
        _id: 1001,
        user_id: 2,
        user_name: "Jane Doe",
        pfp: "https://www.w3schools.com/howto/img_avatar.png",
        message: "You can try taking paracetamol",
        upvotes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        createdAt: "2021-07-30T06:00:00.000Z",
      },
      {
        _id: 1002,
        user_id: 3,
        user_name: "Dank Memer",
        pfp: "https://www.w3schools.com/howto/img_avatar.png",
        message: "Bhai Pani pio daba ke",
        upvotes: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 23, 45, 67, 89, 90],
        createdAt: "2021-07-30T06:00:00.000Z",
      },
    ],
    upvotes: [1, 2, 5, 8, 11, 31, 13],
    createdAt: "2021-07-30T06:00:00.000Z",
  },
  {
    _id: 2000,
    user_id: 4,
    user_name: "Ankur Singh",
    pfp: "https://www.w3schools.com/howto/img_avatar.png",
    post: {
      message: "Bhai koi diabetes ka ilaaj batao pls {crying emoji}",
      image: DoctorPng1,
    },
    replies: [
      {
        _id: 2001,
        user_id: 1,
        user_name: "Jane Doe",
        pfp: "https://www.w3schools.com/howto/img_avatar.png",
        message: "Marjao",
        upvotes: [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 23, 45, 67, 89, 90, 100, 101, 102,
          103, 104, 105, 106, 107, 108, 109, 110,
        ],
        createdAt: "2021-07-30T06:00:00.000Z",
      },
      {
        _id: 2002,
        user_id: 3,
        user_name: "Dank Memer",
        pfp: "https://www.w3schools.com/howto/img_avatar.png",
        message: "Sugar kam khao",
        upvotes: [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 23, 45, 67, 89, 90, 100, 101, 102,
          103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116,
          117, 118, 119, 120,
        ],
        createdAt: "2021-07-30T06:00:00.000Z",
      },
    ],
    upvotes: [2, 3, 4, 5, 6, 7, 8, 9, 10],
    createdAt: "2021-07-30T06:00:00.000Z",
  },
];
export default { CommunityPosts };
