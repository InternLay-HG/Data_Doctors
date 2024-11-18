import { MdKeyboardArrowRight } from "react-icons/md";

export default function Home() {
  return (
    <div className="flex max-lg:flex-col items-center justify-center mt-[15rem] max-lg:mt-5 mx-[8rem] max-xl:mx-[4rem] max-lg:mx-[2rem]">
      <div className="flex flex-col justify-center  items-start my-10 mx-auto max-lg:order-2">
        <h1 className="max-sm:text-7xl  max-lg:text-center font-bold text-9xl text-start">
          The Future of{" "}
          <span className="bg-gradient-to-r from-blue-500 to-blue-800 text-transparent bg-clip-text">
            {" "}
            Personal Health
          </span>
        </h1>
        <p className="mt-10 text-start max-lg:text-center mx-auto font-thin text-gray-500 max-w-4xl text-2xl mb-10">
          Take control of your health with HealthGuardian. Our AI-powered
          platform provides you with the tools and support to live a healthier
          life.
        </p>
        <button className="uppercase tracking-wide bg-gradient-to-r flex items-center justify-between text-white gap-3 from-blue-400 to-blue-700 px-10 py-4 max-lg:mx-auto rounded-full transition ease-in-out hover:scale-110 duration-300 font-medium">
          Start Monitoring
          <MdKeyboardArrowRight size={30} />
        </button>
      </div>
      <div className="relative max-lg:order-1">
        <img
          src="https://img.freepik.com/premium-vector/man-woman-wearing-masks-hold-protective-shield-with-cross-symbol_520881-9655.jpg?w=1060"
          alt=""
          className="w-[1000px] h-[350px] max-lg:w-[500px] max-lg:h-[300px] border-double border-8 border-b-black border-l-gray-500 rounded-full object-cover my-4"
        />
        <div className="absolute w-[100px] h-[100px] bottom-10 max-lg:bottom-3 max-lg:left-[3px] ml-6 m-1 border-2 border-b-neutral-500 border-l-neutral-500 border-transparent rounded-xl"></div>
        <div className="absolute w-[100px] h-[100px] right-10 top-8 max-lg:right-4 max-lg:top-5 border-2 border-t-neutral-500 border-r-neutral-500 border-transparent rounded-xl"></div>
      </div>
    </div>
  );
}
