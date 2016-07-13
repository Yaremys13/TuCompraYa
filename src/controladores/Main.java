package controladores;
import com.enterprisedt.net.ftp.FTPTransferType;
import com.enterprisedt.net.ftp.FileTransferClient;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

class Main {
public static void main(String[] args) {
	//cargarImagen("WebContent/imagenes/", "8320.3.jpg");
}

    public static String cargarImagen(InputStream source,String file,String dir) {
    	String val = "";

    	 //Main m = new Main("ftp.servidor.com", "userFTP", "passFTP");

         /*try{
             FileTransferClient ftc = new FileTransferClient();
             /**
              * Parametros de conexion

             ftc.setRemotePort(21);
             ftc.setRemoteHost("ftp.tucompraya.com");
             ftc.setUserName("compra1");
             ftc.setPassword("L0=138p?sT");
             ftc.connect();

             /**
              * Establecemos el modo de transferencia en Binario

             ftc.setContentType(FTPTransferType.BINARY);

             ftc.changeDirectory("httpdocs/"+dir);
             ftc.setDetectContentType(true);

             /**
              * En este caso en particular subiremos
              * un archivo llamado pamela.avi a nuestro servidor

             String file2;
             if (file.lastIndexOf("/")>0)
            	 file2 = file.substring(file.lastIndexOf("/")+1);
             else if (file.lastIndexOf("\\")>0)
            	 file2 = file.substring(file.lastIndexOf("\\")+1);

             System.out.println(file);
             //File source = new File(ruta,file);

             OutputStream os = ftc.uploadStream(file);
             //InputStream fis = new FileInputStream(source);

             //long fin = source.length();
             long ini = 0;
             int x = 0;
             byte[] b = new byte[2048];

             while ((x = source.read(b)) > 0) {
                 val += " PASA ";
            	 ini+=x;
                 os.write(b, 0, x);
                 /**
                  * Por simple regla de 3 podemos saber que porcentaje
                  * hemos subido y cuanto falta por subir

                 System.out.println("Tamaño del archivo: "
                         + " - Subido: " + ini);
                 System.out.println("Porcentaje: "
                         + ((ini * 100) / fin) + "%");
             }

             os.close();
             //fis.close();
             ftc.disconnect();

         }catch(Exception e){
             val+=" PASA POR EL ERROR "+e.getMessage();
        	 e.printStackTrace();
         } finally{}
         return val;*/

    	try {
			OutputStream out = new FileOutputStream(file);

			byte[] buf = new byte[1024];
			int len;
			while ((len = source.read(buf)) > 0) {
			    out.write(buf, 0, len);

			}
			source.close();
			out.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }


}
