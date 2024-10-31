export default function Home() {
  return (
    <div className="flex items-center my-10 mx-10">
      <div className="flex flex-col justify-start items-start my-8 mx-1">
        <h1 className="text-4xl font-bold sm:text-5xl lg:text-9xl text-start tracking-wide">
          The Future of{" "}
          <span className="bg-gradient-to-r from-blue-500 to-blue-800 text-transparent bg-clip-text">
            {" "}
            Personal Health
          </span>
        </h1>
        <p className="mt-10 text-start font-medium text-gray-500 max-w-4xl text-2xl mb-10">
          Take control of your health with HealthGuardian. Our AI-powered
          platform provides you with the tools and support to live a healthier
          life.
        </p>
        <button className="bg-gradient-to-r flex items-center justify-between text-white gap-3 from-blue-400 to-blue-700 lg:py-4 py-5 lg:pl-10 pl-5 lg:pr-8 pr-3 rounded-full transition ease-in-out hover:scale-110 duration-300">
          Get Started
        </button>
      </div>
      <div className="relative">
        <img
          src="https://img.freepik.com/premium-vector/man-woman-wearing-masks-hold-protective-shield-with-cross-symbol_520881-9655.jpg?w=1060"
          alt=""
          className="w-full h-full border-double border-8 border-b-black border-l-gray-500 rounded-full object-cover my-4 mx-4"
        />
        <div className="absolute w-[100px] h-[100px] bottom-8 ml-9 m-1 border-2 border-b-neutral-500 border-l-neutral-500 border-transparent rounded-xl"></div>
        <div className="absolute w-[100px] h-[100px] right-8 top-8 border-2 border-t-neutral-500 border-r-neutral-500 border-transparent rounded-xl"></div>
      </div>
    </div>
  );
}
