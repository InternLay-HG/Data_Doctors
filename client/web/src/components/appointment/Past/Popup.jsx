import { X } from "lucide-react";

export default function Popup({ children, onClose }) {
  return (
    <div className="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50">
      <div className="flex bg-white p-6 rounded-3xl shadow-lg relative w-1/2">
        <div
          onClick={onClose}
          className="cursor-pointer absolute top-4 right-4 hover:bg-gray-200 rounded-full py-3 px-3"
        >
          <X />
        </div>
        {children}
      </div>
    </div>
  );
}
