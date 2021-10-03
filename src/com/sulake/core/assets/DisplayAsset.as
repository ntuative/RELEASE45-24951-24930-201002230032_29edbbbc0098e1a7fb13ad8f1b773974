package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_18:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_891:String;
      
      protected var var_413:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_413 = param1;
         var_891 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_413;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            var_18 = DisplayAsset(param1).var_18;
            var_413 = DisplayAsset(param1).var_413;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return var_891;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            var_18 = param1 as DisplayObject;
            if(var_18 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            var_18 = DisplayAsset(param1).var_18;
            var_413 = DisplayAsset(param1).var_413;
            if(var_18 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return var_18;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(var_18.loaderInfo.loader != null)
               {
                  var_18.loaderInfo.loader.unload();
               }
            }
            var_18 = null;
            var_413 = null;
            _disposed = true;
            var_891 = null;
         }
      }
   }
}
