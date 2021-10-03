package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaneMaterialCellColumn
   {
      
      public static const const_293:int = 1;
      
      public static const const_190:int = 3;
      
      public static const const_189:int = 5;
      
      public static const const_185:int = 2;
      
      public static const const_495:int = 0;
      
      public static const const_204:int = 4;
       
      
      private var _width:int = 1;
      
      private var var_29:Array;
      
      private var var_729:Vector3d = null;
      
      private var var_23:BitmapData;
      
      private var var_1349:int = 1;
      
      private var var_1084:Boolean = true;
      
      public function PlaneMaterialCellColumn(param1:int, param2:Array, param3:int = 1)
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var_29 = [];
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         _width = param1;
         if(param2 != null)
         {
            _loc4_ = 0;
            while(_loc4_ < param2.length)
            {
               _loc5_ = param2[_loc4_] as PlaneMaterialCell;
               if(_loc5_ != null)
               {
                  var_29.push(_loc5_);
                  if(!_loc5_.isStatic)
                  {
                     var_1084 = false;
                  }
               }
               _loc4_++;
            }
         }
         var_1349 = param3;
         var_729 = new Vector3d();
      }
      
      private function renderRepeatLast(param1:IVector3d) : void
      {
         var _loc4_:* = null;
         if(var_23 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = renderCells(var_29,_loc3_,true,param1);
         _loc2_ = var_29["-1"] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc3_ < var_23.height)
            {
               _loc3_ = renderCells(_loc4_,_loc3_,true,param1);
            }
         }
      }
      
      private function getCellsHeight(param1:Array, param2:IVector3d) : int
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return 0;
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = param1[_loc4_] as PlaneMaterialCell;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.getHeight(param2);
               _loc3_ += _loc6_;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function renderRepeatBorders(param1:IVector3d) : void
      {
         if(var_23 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:* = [];
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = 1;
         while(_loc7_ < -1)
         {
            _loc2_ = var_29[_loc7_] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc6_ = _loc2_.getHeight(param1);
               if(_loc6_ > 0)
               {
                  _loc5_ += _loc6_;
                  _loc4_.push(_loc2_);
               }
            }
            _loc7_++;
         }
         if(false)
         {
            _loc2_ = var_29[0] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc6_ = _loc2_.getHeight(param1);
               if(_loc6_ > 0)
               {
                  _loc5_ += _loc6_;
                  _loc4_.push(_loc2_);
               }
            }
         }
         var _loc8_:* = 0 - _loc5_ >> 1;
         var _loc9_:int = renderCells(_loc4_,_loc8_,true,param1);
         _loc2_ = var_29[0] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc8_ >= 0)
            {
               _loc8_ = int(renderCells(_loc4_,_loc8_,false,param1));
            }
         }
         _loc2_ = var_29["-1"] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc9_ < var_23.height)
            {
               _loc9_ = renderCells(_loc4_,_loc9_,true,param1);
            }
         }
      }
      
      private function renderRepeatNone(param1:IVector3d) : void
      {
         if(var_23 == null)
         {
            return;
         }
         renderCells(var_29,0,true,param1);
      }
      
      private function renderRepeatFirst(param1:IVector3d) : void
      {
         var _loc4_:* = null;
         if(var_23 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = renderCells(var_29,_loc3_,false,param1);
         _loc2_ = var_29[0] as PlaneMaterialCell;
         if(_loc2_ != null)
         {
            _loc4_ = [_loc2_];
            while(_loc3_ >= 0)
            {
               _loc3_ = renderCells(_loc4_,_loc3_,false,param1);
            }
         }
      }
      
      private function renderRepeatCenter(param1:IVector3d) : void
      {
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         if(var_23 == null)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:* = [];
         var _loc5_:* = [];
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         _loc9_ = 0;
         while(_loc9_ < 0)
         {
            _loc2_ = var_29[_loc9_] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc8_ = _loc2_.getHeight(param1);
               if(_loc8_ > 0)
               {
                  _loc6_ += _loc8_;
                  _loc4_.push(_loc2_);
               }
            }
            _loc9_++;
         }
         _loc9_ = 1;
         while(_loc9_ < var_29.length)
         {
            _loc2_ = var_29[_loc9_] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc8_ = _loc2_.getHeight(param1);
               if(_loc8_ > 0)
               {
                  _loc7_ += _loc8_;
                  _loc5_.push(_loc2_);
               }
            }
            _loc9_++;
         }
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(_loc6_ + _loc7_ > var_23.height)
         {
            _loc10_ = _loc6_ + _loc7_ - 0;
            _loc11_ -= _loc10_ >> 1;
            _loc12_ += _loc10_ - (_loc10_ >> 1);
         }
         if(_loc10_ == 0)
         {
            _loc2_ = var_29[0] as PlaneMaterialCell;
            if(_loc2_ != null)
            {
               _loc8_ = _loc2_.getHeight(param1);
               if(_loc8_ > 0)
               {
                  _loc13_ = 0 - (_loc6_ + _loc7_);
                  _loc14_ = Math.ceil(_loc13_ / _loc8_) * _loc8_;
                  _loc11_ = _loc6_ - (_loc14_ - _loc13_ >> 1);
                  _loc15_ = _loc11_ + _loc14_;
                  _loc16_ = [_loc2_];
                  while(_loc11_ < _loc15_)
                  {
                     _loc11_ = renderCells(_loc16_,_loc11_,true,param1);
                  }
               }
            }
         }
         _loc11_ = 0;
         renderCells(_loc4_,_loc11_,true,param1);
         renderCells(_loc5_,_loc12_,false,param1);
      }
      
      private function renderRepeatAll(param1:IVector3d) : void
      {
         if(var_23 == null)
         {
            return;
         }
         var _loc2_:int = getCellsHeight(var_29,param1);
         var _loc3_:int = 0;
         if(_loc2_ > var_23.height)
         {
         }
         while(_loc3_ < var_23.height)
         {
            _loc3_ = renderCells(var_29,_loc3_,true,param1);
            if(_loc3_ == 0)
            {
               return;
            }
         }
      }
      
      public function render(param1:int, param2:IVector3d) : BitmapData
      {
         var _loc3_:int = 0;
         if(var_1349 == const_495)
         {
            _loc3_ = getCellsHeight(var_29,param2);
            param1 = _loc3_;
         }
         if(isStatic)
         {
            if(var_23 != null)
            {
               if(var_23.height == param1 && Vector3d.isEqual(var_729,param2))
               {
                  return var_23;
               }
               var_23.dispose();
               var_23 = null;
            }
         }
         else if(var_23 != null)
         {
            if(var_23.height == param1)
            {
               var_23.fillRect(var_23.rect,16777215);
            }
            else
            {
               var_23.dispose();
               var_23 = null;
            }
         }
         if(var_23 == null)
         {
            var_23 = new BitmapData(_width,param1,true,16777215);
         }
         var_729.assign(param2);
         if(false)
         {
            return var_23;
         }
         switch(var_1349)
         {
            case const_495:
               renderRepeatNone(param2);
               break;
            case const_185:
               renderRepeatBorders(param2);
               break;
            case const_190:
               renderRepeatCenter(param2);
               break;
            case const_204:
               renderRepeatFirst(param2);
               break;
            case const_189:
               renderRepeatLast(param2);
               break;
            default:
               renderRepeatAll(param2);
         }
         return var_23;
      }
      
      public function get isStatic() : Boolean
      {
         return var_1084;
      }
      
      private function renderCells(param1:Array, param2:int, param3:Boolean, param4:IVector3d) : int
      {
         if(param1 == null || param1.length == 0 || var_23 == null)
         {
            return param2;
         }
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            if(param3)
            {
               _loc5_ = param1[_loc7_] as PlaneMaterialCell;
            }
            else
            {
               _loc5_ = param1[param1.length - 1 - _loc7_] as PlaneMaterialCell;
            }
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.render(param4);
               if(_loc6_ != null)
               {
                  if(!param3)
                  {
                     param2 -= _loc6_.height;
                  }
                  var_23.copyPixels(_loc6_,_loc6_.rect,new Point(0,param2),_loc6_,null,true);
                  if(param3)
                  {
                     param2 += _loc6_.height;
                  }
                  if(param3 && param2 >= var_23.height || !param3 && param2 <= 0)
                  {
                     return param2;
                  }
               }
            }
            _loc7_++;
         }
         return param2;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_29 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_29.length)
            {
               _loc2_ = var_29[_loc1_] as PlaneMaterialCell;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_29 = null;
         }
         if(var_23 != null)
         {
            var_23.dispose();
            var_23 = null;
         }
         if(var_729 != null)
         {
            var_729 = null;
         }
      }
   }
}
