/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ece356;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author YeounJun
 */
public class Query3 implements Serializable
{
   private String empID = "", deptID = "", salary = "";
   private String empName = "", job = "";

    public Query3(String empID, String empName, String job, String deptID, String salary)
    {
        this.empID = empID;
        this.empName = empName;
        this.job = job;
        this.deptID = deptID;
        this.salary = salary;
    }

    public String getEmpID()
    {
        return empID;
    }
    
    public String getEmpName()
    {
        return empName;
    }
    
    public String getJob()
    {
        return job;
    }

    public String getDeptID()
    {
        return deptID;
    }

    public String getSalary()
    {
        return this.salary;
    }
}
