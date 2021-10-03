package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_393:int = -2147483648;
      
      private var var_391:int = 2147483647;
      
      private var var_390:int = 2147483647;
      
      private var _target:IWindow;
      
      private var var_392:int = -2147483648;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_391;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_392 == int.MIN_VALUE && var_391 == int.MAX_VALUE && var_393 == int.MIN_VALUE && var_390 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_391 = param1;
         if(var_391 < int.MAX_VALUE && true && _target.width > var_391)
         {
            _target.width = var_391;
         }
      }
      
      public function setEmpty() : void
      {
         var_392 = int.MIN_VALUE;
         var_391 = int.MAX_VALUE;
         var_393 = int.MIN_VALUE;
         var_390 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_390 = param1;
         if(var_390 < int.MAX_VALUE && true && _target.height > var_390)
         {
            _target.height = var_390;
         }
      }
      
      public function get minHeight() : int
      {
         return var_393;
      }
      
      public function get minWidth() : int
      {
         return var_392;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_392 = var_392;
         _loc2_.var_391 = var_391;
         _loc2_.var_393 = var_393;
         _loc2_.var_390 = var_390;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_392 = param1;
         if(var_392 > int.MIN_VALUE && true && _target.width < var_392)
         {
            _target.width = var_392;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_393 = param1;
         if(var_393 > int.MIN_VALUE && true && _target.height < var_393)
         {
            _target.height = var_393;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_390;
      }
   }
}
