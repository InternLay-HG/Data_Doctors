import { AlignJustify, X } from "lucide-react";

export default function Navbar({ collapsed, onCollapseToggle }) {
  return (
    <div className="flex justify-between items-center py-5 px-10 max-sm:px-5 border border-b-gray-400 bg-white">
      <div className="flex items-center justify-start gap-5 py-5">
        <div className="lg:hidden md:flex flex-col justify-end max-sm:text-[16px]">
          <div onClick={() => onCollapseToggle(!collapsed)}>
            <AlignJustify />
          </div>
        </div>
        <header className="text-3xl font-bold max-sm:text-[16px]">Data Doctors</header>
      </div>
      <div className="flex justify-center space-x-2 max-sm:space-x-0 items-center">
        <button
          onClick={() => (window.location.href = "/login")}
          className="py-5 px-10 max-sm:px-8 max-sm:text-[16px] hover:bg-blue-500/10 text-blue-700 rounded-full transition ease-in-out hover:scale-110 duration-300"
        >
          Login
        </button>
        <button
          onClick={() => (window.location.href = "/signup")}
          className="py-5 px-12 max-sm:px-8 max-sm:text-[16px] hover:bg-green-500/10 rounded-full text-[#fff] bg-gradient-to-r from-blue-400 to-blue-700 text-2xl font-medium transition ease-in-out hover:scale-110 duration-300"
        >
          Sign up
        </button>
      </div>
    </div>  
  );
}
