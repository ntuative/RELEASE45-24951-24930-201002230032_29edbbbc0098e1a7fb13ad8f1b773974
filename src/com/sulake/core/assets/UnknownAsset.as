package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1068:AssetTypeDeclaration;
      
      private var var_891:String;
      
      private var var_18:Object = null;
      
      public function UnknownAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1068 = param1;
         var_891 = param2;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1068;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var_18 = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         var_18 = param1.content as Object;
      }
      
      public function get content() : Object
      {
         return var_18;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_18 = null;
            var_1068 = null;
            var_891 = null;
         }
      }
      
      public function get url() : String
      {
         return var_891;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + var_18;
      }
   }
}
