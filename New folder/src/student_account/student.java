/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package student_account;

import Close.Frame.CloseFrame;
import Connection.Website.SchoolConnection;
import Console.TextAreaOutputStream;
import java.awt.List;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import net.proteanit.sql.DbUtils;
import properties.properties;

/**
 *
 * @author Saboor
 */
public class student extends javax.swing.JFrame {

    /**
     * Creates new form student
     */
    private Connection con = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    private Statement st = null;
    private String id;
    private properties pro;
    private SchoolConnection connection;
    private DefaultTableModel modal;
    private CloseFrame closeframe;

    public student(String id) {
        initComponents();
        connection = new SchoolConnection();
        con = connection.getConnetion();
        this.id = id;
        String welcome = jLabel1.getText();
        jLabel1.setText(welcome + "  " + id);
        Details();
    }

    public student() {

    }

    public final void Details() {
        pro = new properties();
        closeframe = new CloseFrame("Cancel", this);
        modal = new DefaultTableModel();
        pro.setImage(new ImageIcon(getClass().getResource("../images/loginicon.png")));
        this.setIconImage(pro.getImage().getImage());
        pro.setTitle(" Student " + id);
        setTitle(pro.getTitle());
        Refreshing();
        Table_properties();
        RetrieveClassOfStudent();
        

    }

    private void Refreshing() {
        try {
            String retreive = "SELECT name AS 'NAME', lastname AS 'Last Name', address AS 'Address', email AS 'E-mail',  age AS 'Age', country AS 'Country'  FROM student WHERE nim = '" + id + "'";
            stmt = con.prepareStatement(retreive);
            rs = stmt.executeQuery();
            jTable1.setModel(DbUtils.resultSetToTableModel(rs));
//           schedule

        } catch (Exception e) {
            e.getMessage();
        }
    }

    public void Table_properties() {
        jTable1.getTableHeader().setReorderingAllowed(false);
        jTable2.getTableHeader().setReorderingAllowed(false);
        jTable1.setRowHeight(30);
        jTable2.setRowHeight(30);
         jTable1.setDefaultEditor(Object.class, null);
            jTable1.getTableHeader().setReorderingAllowed(false);
            ((DefaultTableCellRenderer) jTable1.getTableHeader().getDefaultRenderer())
                 .setHorizontalAlignment(JLabel.CENTER);
        jTable2.setDefaultEditor(Object.class, null);
            jTable2.getTableHeader().setReorderingAllowed(false);
            ((DefaultTableCellRenderer) jTable2.getTableHeader().getDefaultRenderer())
                 .setHorizontalAlignment(JLabel.CENTER);
        
    }

       /* This mothod retrieve all student information which is in the classes 
        *
        * Abdul Saboor Hamedi, the author of this system....
        *
        * this is also student schedule, all schedule will be here */
    public void RetrieveClassOfStudent() {
       
        try {
            String CountClasses = "SELECT COUNT(*) FROM classes WHERE classes.nim = '" + id + "'";
            rs = stmt.executeQuery(CountClasses);
            int rows = 0;
            while (rs.next()) {
                System.out.println(rows = rs.getInt("COUNT(*)"));;
                if (rows == 0) {
                    System.out.println("Not data is available");
                } else {
                    int count =0;
                    String ScheduleQuery = "SELECT * FROM student "
                            + "INNER JOIN classes ON"
                            + " student.nim=classes.nim "
                            + " WHERE student.nim  = '"+id+"' ORDER BY classes.class_grade";
                        rs = stmt.executeQuery(ScheduleQuery);
                        modal.addColumn("Grade");
                        modal.addColumn("Class Code");
                        modal.addColumn("Class");
                        modal.addColumn("Days");
                        modal.addColumn("Academic Year");
                        modal.addColumn("Start Time");
                        modal.addColumn("Subject Name");
                        modal.addColumn("Teacher Name");
                       
                        jTable2.setModel(modal);
                        
                     int ClassGrade = 0;
                     while (rs.next()) {
                        PrintStream out = new PrintStream( new TextAreaOutputStream( jTextArea1 ) );
                        System.setOut(out);
                        System.setErr(out);
                        ClassGrade= rs.getInt("class_grade");
                        String ClassCode = rs.getString("class_code");
                        String ClassName = rs.getString("class_name");
                        String ClassDays = rs.getString("days");
                        String ClassStartTime = rs.getString("start_time");
                        String ClassEndTime = rs.getString("end_time");
                        String subjectName = rs.getString("subjectid");
                        String TeacherID = rs.getString("teacherid");             
                        String nimID = rs.getString("nim");
                     
                        modal.addRow(new Object[]{ ClassGrade, ClassCode, ClassName, ClassDays, ClassStartTime,ClassEndTime,subjectName, TeacherID,nimID});
                        modal = (DefaultTableModel) jTable2.getModel();
                        System.out.println( ClassGrade + ": " + ClassCode + ": " + ClassName + ": "+ ClassDays + ": " +ClassStartTime + ": "+ClassEndTime+  ": " + subjectName + ": " + TeacherID);
                       
                    }
                    
                } 
            
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        mainPanel = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jScrollPane3 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new javax.swing.BoxLayout(getContentPane(), javax.swing.BoxLayout.LINE_AXIS));

        mainPanel.setBackground(new java.awt.Color(0, 32, 63));

        jPanel1.setBackground(new java.awt.Color(0, 32, 63));
        jPanel1.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 0, 2, new java.awt.Color(255, 255, 255)));

        jPanel2.setBackground(new java.awt.Color(0, 32, 63));
        jPanel2.setPreferredSize(new java.awt.Dimension(168, 30));
        jPanel2.setLayout(new java.awt.GridLayout(1, 0));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jPanel2.add(jLabel1);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(26, Short.MAX_VALUE)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 168, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(24, 24, 24))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel3.setBackground(new java.awt.Color(0, 32, 63));

        jScrollPane1.setBorder(null);

        jTable1.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jTable1.setGridColor(new java.awt.Color(255, 255, 255));
        jTable1.setSelectionBackground(new java.awt.Color(255, 102, 102));
        jTable1.setSelectionForeground(new java.awt.Color(0, 0, 0));
        jScrollPane1.setViewportView(jTable1);

        jTabbedPane1.addTab("Your Information", jScrollPane1);

        jTable2.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jTable2.setGridColor(new java.awt.Color(255, 255, 255));
        jTable2.setSelectionBackground(new java.awt.Color(255, 102, 102));
        jTable2.setSelectionForeground(new java.awt.Color(0, 0, 0));
        jScrollPane2.setViewportView(jTable2);

        jTabbedPane1.addTab("Schedules", jScrollPane2);

        jScrollPane3.setBorder(null);

        jTextArea1.setEditable(false);
        jTextArea1.setColumns(20);
        jTextArea1.setFont(new java.awt.Font("Monospaced", 1, 18)); // NOI18N
        jTextArea1.setRows(5);
        jScrollPane3.setViewportView(jTextArea1);

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jTabbedPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 836, Short.MAX_VALUE)
                    .addComponent(jScrollPane3))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 155, Short.MAX_VALUE)
                .addContainerGap())
        );

        javax.swing.GroupLayout mainPanelLayout = new javax.swing.GroupLayout(mainPanel);
        mainPanel.setLayout(mainPanelLayout);
        mainPanelLayout.setHorizontalGroup(
            mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(mainPanelLayout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        mainPanelLayout.setVerticalGroup(
            mainPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        getContentPane().add(mainPanel);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(student.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(student.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(student.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(student.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new student().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JPanel mainPanel;
    // End of variables declaration//GEN-END:variables
}
