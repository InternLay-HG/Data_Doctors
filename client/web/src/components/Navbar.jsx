export default function Navbar({handleSignUpClick}) {
  return (
    <div className="flex justify-between items-center py-5 px-10 border border-b-gray-400">
      <header className="text-3xl font-bold">InterLay: Data Doctors</header>
      <button onClick={() => window.location.href = "/signup"} className="py-5 px-12 hover:bg-green-500/10 rounded-full text-[#fff] bg-gradient-to-r from-blue-400 to-blue-700 text-2xl font-medium transition ease-in-out hover:scale-110 duration-300">
        Sign up
      </button>
    </div>
  );
}