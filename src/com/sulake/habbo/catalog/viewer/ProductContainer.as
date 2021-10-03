package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_781:Array;
      
      private var var_417:int;
      
      protected var var_70:Offer;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         var_70 = param1;
         var_781 = param2;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in var_781)
         {
            _loc1_.dispose();
         }
         var_781 = null;
         var_417 = 0;
      }
      
      public function get products() : Array
      {
         return var_781;
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function get firstProduct() : IProduct
      {
         return var_781[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_417 = param1;
      }
      
      public function get iconCallbackId() : int
      {
         return var_417;
      }
      
      public function get offer() : Offer
      {
         return var_70;
      }
   }
}
