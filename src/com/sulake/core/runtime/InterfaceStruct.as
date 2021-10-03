package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_387:uint;
      
      private var var_991:IUnknown;
      
      private var var_1200:String;
      
      private var var_990:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_990 = param1;
         var_1200 = getQualifiedClassName(var_990);
         var_991 = param2;
         var_387 = 0;
      }
      
      public function get iid() : IID
      {
         return var_990;
      }
      
      public function get disposed() : Boolean
      {
         return var_991 == null;
      }
      
      public function get references() : uint
      {
         return var_387;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_387) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_991;
      }
      
      public function get iis() : String
      {
         return var_1200;
      }
      
      public function reserve() : uint
      {
         return ++var_387;
      }
      
      public function dispose() : void
      {
         var_990 = null;
         var_1200 = null;
         var_991 = null;
         var_387 = 0;
      }
   }
}
