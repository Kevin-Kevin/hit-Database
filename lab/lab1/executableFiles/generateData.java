import java.io.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

/*
 * 从四个文件中读取数据, 生成四张表
 *
 */
public class generateData {


  public static void main(String[] args) {
    new HashMap<>();
    Integer a = 2;
    double d= Math.cos(3.0);
    List<departmentName> dNameList = new LinkedList<>();
    List<employeeNameAndId> eNameAndIdList = new LinkedList<>();
    List<employeeLocation> eLocationList = new LinkedList<>();
    List<projectNameAndLocation> pNameAndLocationList = new LinkedList<>();

    try {
      // 读取部门名 txt
      BufferedReader departmentNameBufferedReader =new BufferedReader(
            new FileReader("/Users/kevinzhang/Desktop/codeForLearning/hit-database/lab/lab1/executableFiles/originalData/department_name.txt"));
      // 读取员工 name id
      BufferedReader employNameIdFileReader =new BufferedReader(
              new FileReader("/Users/kevinzhang/Desktop/codeForLearning/hit-database/lab/lab1/executableFiles/originalData/employee_id.txt"));
      // 读取员工住址 我觉得 address 比 location 更合适
      BufferedReader employeeLocationFileReader = new BufferedReader(
              new FileReader("/Users/kevinzhang/Desktop/codeForLearning/hit-database/lab/lab1/executableFiles/originalData/employee_location.txt"));

      // 读取项目名和位置
      BufferedReader projectNameLocationFileReader = new BufferedReader(
              new FileReader("/Users/kevinzhang/Desktop/codeForLearning/hit-database/lab/lab1/executableFiles/originalData/project_name_location.txt"));


      // 读取到 list
      String str;
      while ((str = departmentNameBufferedReader.readLine())!= null) {
        dNameList.add(new departmentName(str));
      }
      while ((str=employNameIdFileReader.readLine())!=null){
        String[] strSplit = str.split(" ");
        eNameAndIdList.add(new employeeNameAndId(strSplit[0],strSplit[1]));
      }
      while((str=employeeLocationFileReader.readLine())!=null){
        eLocationList.add(new employeeLocation(str));

      }
      while ((str=projectNameLocationFileReader.readLine())!=null){
        String[] strSplit = str.split(" ");
        pNameAndLocationList.add(new projectNameAndLocation(strSplit[0], strSplit[1]));
      }
      PrintWriter dNameWriter = new PrintWriter(
              new BufferedWriter(new FileWriter("/Users/kevinzhang/Desktop/codeForLearning/hit-database/lab/lab1/executableFiles/generatedData/departments.txt")));
      PrintWriter eLocationWriter = new PrintWriter(
              new BufferedWriter(new FileWriter("/Users/kevinzhang/Desktop/codeForLearning/hit-database/lab/lab1/executableFiles/generatedData/employees.txt")));

      int i=0;
      for (departmentName index : dNameList) {
        // 写入部门名 , 编号 , 领导名, 领导就任时间
        System.out.println(dNameList.get(i).name);
        dNameWriter.write(dNameList.get(i).name+" "+
                              String.valueOf(i+1000)+" "+
                              eNameAndIdList.get(i).name+" "+
                              "2017.09"+"\n"
        );


        i++;
      }
      dNameWriter.close();
      i=0;
      for (employeeNameAndId index : eNameAndIdList) {

        int random = new Random().nextInt(dNameList.size());

        eLocationWriter.write(index.name+" "+
                index.id+" "+
                eLocationList.get(new Random().nextInt(eLocationList.size())).location+" "+
                String.valueOf(2000+new Random().nextInt(2000))+" "+
                eNameAndIdList.get(random).id+" "+
                dNameList.get(new Random().nextInt(dNameList.size())).name+"\n"
        );
      i++;
      }
  eLocationWriter.close();
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }


  }

}

class departmentName {
  String name;

  public departmentName(String name) {
    this.name = name;
  }
}

class employeeNameAndId {
  String name;
  String id;

  public employeeNameAndId(String name, String id) {
    this.name = name;
    this.id  = id;
  }
}

class employeeLocation {
  String location;

  public employeeLocation(String location) {
    this.location = location;
  }
}

class projectNameAndLocation {
  String name;
  String location;

  public projectNameAndLocation(String name, String location) {
    this.name = name;
    this.location = location;
  }
}