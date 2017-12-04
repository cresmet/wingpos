package ibd.specialized.com.sales;

import java.security.MessageDigest;

public class encryptURI
{
    public static void main(String[] args)throws Exception
    {
    	String password = "48b8b97fa6a9172e866ad4d7dee8162dservice2017-01-10T19:26:22.788-08:00Id,SourceCode,OrderStatus,OrderShopId,OrderDate,OrderAmount,OrderShopName,ShipperId,LogisticsNumber,ShortAddress,ReceivedAmount,ShipAmount,ReceivName,ReceivAddress,ReceivAreaName,ReceivCityName,ReceivProvinceName,ReceivZip,ReceivPhone,ReceivMobile,ProductAmount,CodAmount,PayType,PlatForm,ModifiedDate,ModifierId,IsInterecept,BuyerMessage,SellerMemo,InSideRemark,InvoiceHeader,InvoiceContent,PreSaleStatus,AuditTime,ExtendTextBurgeon.Wing.OnlineOrders.increment.get11002017-01-10T19:26:22.781-08:002017-01-10T19:26:22.790-08:001";

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        System.out.println("Digest(in hex format):: " + sb.toString());

        //convert the byte to hex format method 2
        StringBuffer hexString = new StringBuffer();
    	for (int i=0;i<byteData.length;i++) {
    		String hex=Integer.toHexString(0xff & byteData[i]);
   	     	if(hex.length()==1) hexString.append('0');
   	     	hexString.append(hex);
    	}
    	System.out.println("Digest(in hex format):: " + hexString.toString());
    }
}