package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_710:IAssetLoader;
      
      private var var_1129:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1129 = param1;
         var_710 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_710;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_710 != null)
            {
               if(true)
               {
                  var_710.dispose();
                  var_710 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1129;
      }
   }
}
