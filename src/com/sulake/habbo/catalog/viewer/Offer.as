package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_783:String = "price_type_none";
      
      public static const const_381:String = "pricing_model_multi";
      
      public static const const_459:String = "price_type_credits";
      
      public static const const_368:String = "price_type_credits_and_pixels";
      
      public static const const_460:String = "pricing_model_bundle";
      
      public static const const_389:String = "pricing_model_single";
      
      public static const const_695:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1122:String = "pricing_model_unknown";
      
      public static const const_387:String = "price_type_pixels";
       
      
      private var var_755:int;
      
      private var _offerId:int;
      
      private var var_756:int;
      
      private var var_370:String;
      
      private var var_524:String;
      
      private var var_1745:int;
      
      private var var_707:ICatalogPage;
      
      private var var_1121:String;
      
      private var var_371:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1121 = param1.localizationId;
         var_755 = param1.priceInCredits;
         var_756 = param1.priceInPixels;
         var_707 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_370;
      }
      
      public function get page() : ICatalogPage
      {
         return var_707;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1745 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_371;
      }
      
      public function get localizationId() : String
      {
         return var_1121;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_756;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1121 = "";
         var_755 = 0;
         var_756 = 0;
         var_707 = null;
         if(var_371 != null)
         {
            var_371.dispose();
            var_371 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_524;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1745;
      }
      
      public function get priceInCredits() : int
      {
         return var_755;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_370 = const_389;
            }
            else
            {
               var_370 = const_381;
            }
         }
         else if(param1.length > 1)
         {
            var_370 = const_460;
         }
         else
         {
            var_370 = const_1122;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_370)
         {
            case const_389:
               var_371 = new SingleProductContainer(this,param1);
               break;
            case const_381:
               var_371 = new MultiProductContainer(this,param1);
               break;
            case const_460:
               var_371 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_370);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_755 > 0 && var_756 > 0)
         {
            var_524 = const_368;
         }
         else if(var_755 > 0)
         {
            var_524 = const_459;
         }
         else if(var_756 > 0)
         {
            var_524 = const_387;
         }
         else
         {
            var_524 = const_783;
         }
      }
   }
}
