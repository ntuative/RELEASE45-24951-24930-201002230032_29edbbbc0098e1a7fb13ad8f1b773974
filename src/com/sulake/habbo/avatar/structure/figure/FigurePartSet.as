package com.sulake.habbo.avatar.structure.figure
{
   public class FigurePartSet implements IFigurePartSet
   {
       
      
      private var _id:int;
      
      private var var_1794:Boolean;
      
      private var _gender:String;
      
      private var var_518:Array;
      
      private var var_1511:Array;
      
      private var var_1606:Boolean;
      
      private var var_1793:Boolean;
      
      public function FigurePartSet(param1:XML)
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         super();
         _id = parseInt(param1.@id);
         _gender = String(param1.@gender);
         var_1794 = Boolean(parseInt(param1.@club));
         var_1606 = Boolean(parseInt(param1.@colorable));
         var_1793 = Boolean(parseInt(param1.@selectable));
         var_518 = new Array();
         var_1511 = new Array();
         for each(_loc2_ in param1.part)
         {
            _loc4_ = new FigurePart(_loc2_);
            _loc5_ = indexOfPartType(_loc4_);
            if(_loc5_ != -1)
            {
               var_518.splice(_loc5_,0,_loc4_);
            }
            else
            {
               var_518.push(_loc4_);
            }
         }
         for each(_loc3_ in param1.hiddenlayers.layer)
         {
            var_1511.push(String(_loc3_.@parttype));
         }
      }
      
      public function get gender() : String
      {
         return _gender;
      }
      
      public function get hiddenLayers() : Array
      {
         return var_1511;
      }
      
      public function get isClub() : Boolean
      {
         return var_1794;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1793;
      }
      
      public function getPart(param1:String, param2:int) : IFigurePart
      {
         var _loc3_:* = null;
         for each(_loc3_ in var_518)
         {
            if(_loc3_.type == param1 && _loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function indexOfPartType(param1:FigurePart) : int
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_518.length)
         {
            _loc3_ = var_518[_loc2_];
            if(_loc3_.type == param1.type && _loc3_.index < param1.index)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get parts() : Array
      {
         return var_518;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1606;
      }
   }
}
