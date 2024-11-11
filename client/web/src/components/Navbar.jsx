export default function Navbar({ handleSignUpClick }) {
  return (
    <div className="flex justify-between items-center py-5 px-10 border border-b-gray-400 bg-white">
      <header className="text-3xl font-bold">InterLay: Data Doctors</header>
      <div className="hidden lg:flex justify-center space-x-2 items-center">
        <button
          onClick={() => (window.location.href = "/login")}
          className="py-5 px-10 hover:bg-blue-500/10 text-blue-700 rounded-full transition ease-in-out hover:scale-110 duration-300"
        >
          Login
        </button>
        <button
          onClick={() => (window.location.href = "/signup")}
          className="py-5 px-12 hover:bg-green-500/10 rounded-full text-[#fff] bg-gradient-to-r from-blue-400 to-blue-700 text-2xl font-medium transition ease-in-out hover:scale-110 duration-300"
        >
          Sign up
        </button>
      </div>
    </div>
  );
}
