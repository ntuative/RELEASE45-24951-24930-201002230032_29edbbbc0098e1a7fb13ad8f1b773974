package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var var_18:Sound = null;
      
      private var _disposed:Boolean = false;
      
      private var var_1068:AssetTypeDeclaration;
      
      private var var_891:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_1068 = param1;
         var_891 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1068;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return var_891;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Sound)
         {
            if(var_18)
            {
               var_18.close();
            }
            var_18 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(var_18)
            {
               var_18.close();
            }
            var_18 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(var_18)
            {
               var_18.close();
            }
            var_18 = SoundAsset(param1).var_18;
            return;
         }
      }
      
      public function get content() : Object
      {
         return var_18 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            var_18 = SoundAsset(param1).var_18;
         }
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
   }
}
