package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_490:int = 8;
      
      public static const const_1548:int = 10;
      
      public static const const_1239:int = 6;
      
      private static var var_1015:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1125:int = 0;
      
      public static const const_1471:int = 1;
      
      public static const const_1443:int = 2;
      
      public static const const_1433:int = 3;
      
      public static const const_1533:int = 4;
      
      public static const const_1513:int = 5;
      
      public static const const_1412:int = 9;
      
      public static const const_1572:int = 7;
       
      
      private var var_165:uint = 0;
      
      private var var_1014:uint = 0;
      
      private var var_692:Date;
      
      private var var_2089:int = -1;
      
      private var parseFunc:Function;
      
      private var var_487:Boolean = false;
      
      private var var_2294:int = -1;
      
      private var var_1267:uint = 0;
      
      private var var_2090:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_850:uint;
      
      private var var_18:ByteArray;
      
      private var var_691:uint;
      
      private var var_1505:Boolean = false;
      
      private var var_2293:int = -1;
      
      private var var_1507:String = "2.0";
      
      private var var_166:Boolean = false;
      
      private var var_2088:Boolean = false;
      
      private var var_338:String;
      
      private var var_565:uint = 0;
      
      private var var_1268:int = 0;
      
      private var var_399:String = "";
      
      private var var_693:int = 8;
      
      private var var_1506:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_338 = param1;
         _extraFields = new Dictionary();
         var_18 = new ByteArray();
         var_18.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_565;
      }
      
      public function set filename(param1:String) : void
      {
         var_399 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_166 && false)
         {
            var_18.position = 0;
            if(var_1015)
            {
               var_18.uncompress.apply(var_18,["deflate"]);
            }
            else
            {
               var_18.uncompress();
            }
            var_18.position = 0;
            var_166 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_399;
      }
      
      public function get date() : Date
      {
         return var_692;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1506)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_165 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_165)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1507;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_166)
         {
            uncompress();
         }
         var_18.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_18.readUTFBytes(var_18.bytesAvailable);
         }
         else
         {
            _loc3_ = var_18.readMultiByte(var_18.bytesAvailable,param2);
         }
         var_18.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_693 === const_490 && !var_1505)
         {
            if(var_1015)
            {
               param1.readBytes(var_18,0,var_165);
            }
            else
            {
               if(!var_487)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_18.writeByte(120);
               _loc2_ = uint(~var_2089 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_18.writeByte(_loc2_);
               param1.readBytes(var_18,2,var_165);
               var_18.position = var_18.length;
               var_18.writeUnsignedInt(var_850);
            }
            var_166 = true;
         }
         else
         {
            if(var_693 != const_1125)
            {
               throw new Error("Compression method " + var_693 + " is not supported.");
            }
            param1.readBytes(var_18,0,var_165);
            var_166 = false;
         }
         var_18.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1014 + var_1267 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_18.length = 0;
         var_18.position = 0;
         var_166 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_18.writeUTFBytes(param1);
            }
            else
            {
               var_18.writeMultiByte(param1,param2);
            }
            var_691 = ChecksumUtil.CRC32(var_18);
            var_487 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_692 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1268 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1268 << 8 | 20);
         param1.writeShort(var_338 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_490);
         var _loc5_:Date = var_692 != null ? var_692 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_691);
         param1.writeUnsignedInt(var_165);
         param1.writeUnsignedInt(var_565);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_338 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_399);
         }
         else
         {
            _loc8_.writeMultiByte(var_399,var_338);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_487)
            {
               _loc16_ = var_166;
               if(_loc16_)
               {
                  uncompress();
               }
               var_850 = ChecksumUtil.Adler32(var_18,0,var_18.length);
               var_487 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_850);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_338 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2090);
            }
            else
            {
               _loc8_.writeMultiByte(var_2090,var_338);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_165 > 0)
         {
            if(var_1015)
            {
               _loc13_ = 0;
               param1.writeBytes(var_18,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_18,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_165;
      }
      
      protected function compress() : void
      {
         if(!var_166)
         {
            if(false)
            {
               var_18.position = 0;
               var_565 = var_18.length;
               if(var_1015)
               {
                  var_18.compress.apply(var_18,["deflate"]);
                  var_165 = var_18.length;
               }
               else
               {
                  var_18.compress();
                  var_165 = -6;
               }
               var_18.position = 0;
               var_166 = true;
            }
            else
            {
               var_165 = 0;
               var_565 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1014 + var_1267)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_338 == "utf-8")
         {
            var_399 = param1.readUTFBytes(var_1014);
         }
         else
         {
            var_399 = param1.readMultiByte(var_1014,var_338);
         }
         var _loc2_:uint = var_1267;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_399 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_850 = param1.readUnsignedInt();
               var_487 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1268 = _loc2_ >> 8;
         var_1507 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_693 = param1.readUnsignedShort();
         var_1505 = (_loc3_ & 1) !== 0;
         var_1506 = (_loc3_ & 8) !== 0;
         var_2088 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_338 = "utf-8";
         }
         if(var_693 === const_1239)
         {
            var_2293 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2294 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_693 === const_490)
         {
            var_2089 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_692 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_691 = param1.readUnsignedInt();
         var_165 = param1.readUnsignedInt();
         var_565 = param1.readUnsignedInt();
         var_1014 = param1.readUnsignedShort();
         var_1267 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_18,0,param1.length);
            var_691 = ChecksumUtil.CRC32(var_18);
            var_487 = false;
         }
         else
         {
            var_18.length = 0;
            var_18.position = 0;
            var_166 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_399 + "\n  date:" + var_692 + "\n  sizeCompressed:" + var_165 + "\n  sizeUncompressed:" + var_565 + "\n  versionHost:" + var_1268 + "\n  versionNumber:" + var_1507 + "\n  compressionMethod:" + var_693 + "\n  encrypted:" + var_1505 + "\n  hasDataDescriptor:" + var_1506 + "\n  hasCompressedPatchedData:" + var_2088 + "\n  filenameEncoding:" + var_338 + "\n  crc32:" + var_691.toString(16) + "\n  adler32:" + var_850.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_166)
         {
            uncompress();
         }
         return var_18;
      }
   }
}
