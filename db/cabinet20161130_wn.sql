/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.37 : Database - cabinetms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cabinetms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cabinetms`;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('3bc4bb2ead4143d185ac459cf5d68e93',1,'test_audit.bpmn20.xml','bfbf91e71b594f758116859ae838df75','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"结束审批\"/>\r\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('7ba1daf4f43e434d82f8b3420aac2148',1,'test_audit.png','bfbf91e71b594f758116859ae838df75','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0|\0\0\0=ӳ�\0\0S�IDATx���|T����S����h�˲�l�e�ծZ1��4�X��K]��RVV�\"�Z/�\"\Z1�c\nĀ����D.I�c�1f��E��c��>�9�03�I2I��L^�����\\�\\2��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/�J����%\0\0\0\0�s�m�ɖ-ܟ�t\0\0\0\0�y�vk�\0\0\0\0�V$��T���n\0\0\0\0\0�l�[k���\r\0\0\0\0@��m�vz\0\0\0\0\0�m�=�����\0\0\0\0���κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0���=���̺����q 5\0\0\0\0@�o��x4���R�߶6݁nG�\r\0\0\0\0��Ͷ��j�UM�g�m�D���N7\0\0\0\0����k�[j��M��gz��\r\0\0\0\0�6�vBM�����Ͷo����\0\0\0\0���֦���;�f���?3��\r\0\0\0\0��f���n���G;�m��\0\0\0\0t�f������vG�\0\0\0\0\0a��[��5�i�}�n��\r\0\0\0\0],ά���6k�լ)�M����^v#�ݲ]e]�I���(��(*ʪάj�r�z�poh�E;�p��\Z���Ud��ƙu�Y}xyڤ������-�m���@��\r\0\0�h$}� ý���2[�:h�76���A��l5ڋͺ���C���3N�w���t�n\0\0\0t\'�J�ցg�r�+��o��o��d���`�(��/G)���(�\0\0\0�d�w�������\n�lg|��D6ݭ5����vk������\0\0@����w��yj�y>�jmskͶ�Φ�ޭ}�\0\0\0\04�zK�#�9@�|g���O�@[���l�tۏG�\r\0\0\0�����\'RCH���yB&�h�{��F������8|g\0\0\0hN��$^��l��h�o�=���<���6Z�?�\0\0\0&G/���+�8����l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦��(��\0\0\0hN��gxp\"�!�9�Vt4ݝݼ\0\0\0�L֛syp\"�48:y8��n��F\0\0\0G�V^�ˀI��>�a�t����\0\0\0��>���\'��%+���n�\0\0\0\0�`��&z���D���\0\0\0�C`����f:���?��\0\0\0��\0C�m�f7r\0\0\0�~0tr�M�\r\0\0\0���Nn��h�\0\0\0�!0�й�Y��\0\0\0��\0C\'ʲ�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7�8�u�.�\0\0\0�����i����|�\0\0\0���o�]�xy\0\0\0\0�!0��>��m�\"^\0\0\0�~0����|�\0\0\0���J���\0\0\0�!0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X��+\0\0\0�ul0���\0\0\0X�`�+\0\0\0\0�c��\0\0\0�:6``^\0\0\0�c0�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0��\r0��W�\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0�ul0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X�,���R�SRRfN�8qolllC�޽��:P�P={�������l���Ϳ#�\0\0\0��\0��-[v�ȑ#�cbbԜ9�U~~�jh������:���,**T��ϩ�6������_L�\0\0\0@?X�JM}e}�~�TR���j4��&*���H����SO=�&�\0\0\0�!0���پ��TQ�v�	��\nq�����}��Üc�\0\0\0��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k�\r�#U�f�Q����SN��`�r\0\0\0����R�G���>)�y��7^�b�R5��ԭ���5v̍*>�Z5t�j�n���:��ޫW�<b\0\0\0�!0�\"\\J�11?R.W���5zU¨x�h�p�H�~�����aW�Mwl��Ω��>�Ss��=\0\0\0���&N��wΜ\'�F��f5bx�za�|��V�Jy1Ioپj�P}��v���{;�c5mڽ;�Y�H�\0\0\0@?X��Ґ��c6z\r���\'���Tm��������T�>s����C�?S\'�o�������ջ��0g�N�\0\0\0�!0�\"X�޽UC��f�W߬���*.ڢvoU�w���;vlW�=����P/��q=\0\0\0�����R_6+���j֬�j�o&���BU��]�v�P���o5�����_���Tǋ\0\0\0��\0����Ϋ\Z?W�ֽ�bc��?�TN�ϫJK�Ր�/U��NU\r\r�5�=��b�\0\0\0�!0������S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��6\0\0\0��\r�1��n٤k[�켼��͌t�h�X�D��x�Jz�Y�̼�����P]{����5^�Au�X�\0\0�~��h����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~���:^,�\0\0\0@?XT4�_8%\r�����ݬ�H{U7��|?;��;�	�ܳsu�-M���	js��V��Չł\r\0\0\0�C`�EE�}ԩ�{��G��~y�8�Pˮ��*.n�����zkwi�^�Au�X�\0\0�~��h�?�*�7S_~��J|�i�0�:5b��j��+TܕC�P�Ѿ������Qǎ�EO�{{��ł\r\0\0\0�C`�EE�}�\n�b�\0\0\0�!0������\n�b�\0\0\0�!0����>L�Y�`\0\0\0�`Q�p��\n�b�\0\0\0�!0����>D�Y�`\0\0\0�`Q�p�¬X�\0\0�~��h�PaVmwO��@<\0\0@?XX7��¬Zw�hm]��\0\0\0�C`��w�]�亅g����u��W�/+)��6���_ff�s:\'�u}��z[�۔�������z��K�Ϛ5��c͟?K�>th��uUU[��G��7{����f�UV��kj\n��\r��3�8������Zi�i�\0\0@?X�7ܟ���\r��eYY+�.���5y�̆�H�����;��r��sr��ٳ�JN��\\�n�ݧ���l6�o�3�<CO[]�U?��`n���\Z?�j[�i���v��+�z>ϕ+_pN�߿C����Wk�iyL��gϞ��}_��r~ʔ�tþ/����^�/��\'z�ѣ���Ͼ��G������s�E͘1�l��շ�����[�g���u\\(\0\0\0�~��m���-��LL|L��oٲ.�m�.���*6�����_��Ç�����yy�����*}^[ΟrJo�|�o6�w���J}��cX[��ԡC��˗,���KF��`���euu��oA�\Z�yH.�55�����[����Y�Xmذ��y��eg�R��Unn�~�r^�������?��w�9?PÆ]����|��/�zm�[�i�\0\0@?X�4�iVee�Ԟ=٪��c���ݡD���x������?�k��S99����9��N5��\nu��\'�;��lb�6��O����R����@����<O-\\���\\�w7�x�F���.W�*/߬/KM}N?VEş�u��җ��-R�_��y������ ���^�*����T�|�(�q�瓛�z��]����2����c�}yN׆F��(��(wՙ�Ǭl��1+ެ^���C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX����I��K^/e�-��-���=���c�^�����&%=��g���P��O�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m�:=}v����f���z+��m��=[o��ˏ-Sk֤����U|�}�O~2H�}��oy.��\\nߗL\'���P�\\2�l�W{=�\\���X����5�sw��5Ƭ���5�YIf�c��#i��#��#�~��j�?iVr�]w�R�NK[��B{^�������.�0�j��_W_���]���~d���.+�v�����Ի\\��_�<�4��ٖ�U��U�^������+ӧ�η�Lo�\Z�~�?�8zt��}���|mm����iW�Nҧ��\\&���7^�O.[��I�h74|��O����X윗\r��j�����f��g>�\Z��7��AVt�a��;G�f}a�L^��#�~��n���Y��۝�ӧ��u]f��~o\'u���}q���v#+�rWW��v�\\���_�/^,����(V��̦�bUS�nV*��ý�ld?V))������oذT7��&ݦ�n�����J�y��\nש�.�P7��&<�j�6{}Ǝ�^�zk��,o���#�Tv�\n�h�zM�n��_���G�YY�~_�\0��w�w��-\r��a�Y��ڝ�rý�,9x?��\0�̆��Y�\'��P���[JK7��5fC[m6����Ʈ�\r���kk����Z?����l����j����v7�ǟKr򓺡ݷo�n�������y�.�if��l�?���>��8v��y^r��>`Z��Hg[�������Oy\\�~�w�B�V�_�`�3�\\��nu�e��fϞ�/������^���[�o��p&ߟ˲Vr\0�O+G��Ix?��\0�Ć�c�u�H���]�������\r\r��ÇK�M7��2e��<���ڞ{n}Z*--�:�z}CWz��,��ZC%�#��������Æ��l�SUFF�JM}F?�}�܇�w�^�u���?��µ�	��4�V]r?�&8�l��M����}�������[�x���{��kc��=c6�����{�u�P��7o����{���Vjժ��QCS^�1}�?�Vrd���k�eK�#�\0�G\0�`�pW{UN�\nݼ����t�lv��fڴ�������M�\Z?������>��j8_�w�|�|II�>�r}h�;K�oj�r�)(x��6<����<����u���}��|w��&O�����;��c�?0��������m�����ת[o����ۗWTd����B7���z�����1&��}jp�\Z��9����C`�E\\��QDUSӇ�2M��K{���q\'�IbqtH29x?��\0�����\n���q\'G��#��T����S��!f��N�;��\"萭����,�\Z�J*�*J���{W>\0�7���C`�ET��f��n���i#\0�Q./��@?X�4�T�U��;9:�)@�sT��\0�~��1\r��T�U��;�-�:)\09�@?t����\n���q� G\09�Н\Z���0+\Zn\0� G\0y,*\Z�2*̊�\09�@^�\0���{/fE�\r�� /`�EEý�\n���@�\0r�0�����M�Y�p G\09�`��O�����l�vQaR_}U�Ϝ5.��� /`�E���|(?���RaR��?��9kv�\'\0� G\0y,�]u�e��̙J�F5v�Ui�I$O\0�@�\0�X0����˵�f7<�=zT��&�< G\09�`���&%=H�5f�UK�Y�K�\0�#����0��3O�/*ZA�ۅ���t�9/�u1y@�\0r�0��G�9��w��k�{��Qc·1�	\09�@^�\0�¦����l޼�>�;ݡ�ζ���n�l���@�\0�t�6�g���~����L�e��M/lh(�1������䧿�h����;��\'\0� G\0y�{�Ԭ9fm5��z��)����m��8��� /`�!�eY�/y�\0r�0��9d+�˚W	��	 G\0�@^�\0C��4�﮽���<�\09�`�!���v��e!O\09@�\0�:&�h~P2���w��@�\0�#����v�uۮq�<�	 G\0�@^�\0C�d�z����<�\09�`^K[��.7y�\0r�0��NY�4���<�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0r��00��<�@�\0�0��W`� G\0�N�,k@�T;y�X�y�#����\\�4�cx�X�y�#��^v�v�Y�x�X�y�#��ސ\Z�q�<,�<�@�\0�����r�w�ٺ��\0�#�� /@��.7��fa\0�@�\0r��d\Zl�fa\0�@�\0r����y4�	�,�<�@�\0�t���l�fa\0�@�\0r��\ra��0\0� G\09�\"g�)�;%%e�ĉ����6���;��pQ-TϞ=�;���?>|�F��HF�@�\0�#��tc˖-�g�ȑ�111jΜ�*??O54|e���QA��nEE�*1�95p�������5_�Y�y�#\0� /�Lj�+���맒�^P.W��46Q�X�ɋT�>}�:��Soba\0�@�\0�#��t�f��.PEE����[�Uyy��۷�?�����,�G\09@�\0�ҽ,[��ٲ]T��l\n]^�t�Kj̘5j�����Q7ďTɋ��MG������SN9����^�y�#\0� /�h�(�{��kꓒ�7O~�U+�/U�>J�z�X]c�ܨ��UC�^�������8��^�z�0\0� G\0�@^�TJ�11?R.W��6zU¨x�h�p�H�~�����aW�Mwl�������Ԝq,�<�\0r��(4qℽs�<i6�_7����櫬�2TʋIz��U#���������Qm�i���i΂D`�\09�K��Ґ��c6�\r���\'���Tm��������T�>s����C�?S\'�o�������ջ��0g�N`�\09�K�ݻ�jh��l\0��c�R�E[Ԏ�j��]rzǎ����{��%��9\\�d�%X�R� G\0�@^��R��f�r�]͚5SM��$URR���ۣk׮j�}��f<x������ޖj{u��ě%GeO���!v,�r�䥛4�u^����Z��5�SU�Q�zp�}^UZZ��\\~�z}u�jh������W7H�O�-[�?��f�\r�#\0� /ݤ���S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��W�ķ�n�r���\0r��hk��9�u�&�[��d��mVof��F{��%��ŋT�Ϫg�=��������kF��o�����Ih�����;�,�r�Q��f�g�Z��ͪ��p�Y���i�Lk�(n����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~����^Q����f�-�,�r�Q��qf�ZM�+f�f� �N����1V#�dM�oք�l��pJ\Zn�	��o�Y����n���~v�5w��g��[��1��朷�����o(�Fp[�����\0� G\0�4/�Dg�Un5ӽ���4��[ͺ �\Z�N�ݻM=�������Zv%�WqqCԯ\'��[�KK�����eo(��b-����f�\r�#\0��ܼ�7���E�W��>�~�ek���}�U�o�����S����*a�uj��+�СW��+���f�}�����ߣ�������T�+��P:�{8�����\0rDh^d%^���I�w�u����>BuQE�JkH����� /!2�j�c:�~c����-�f���Eo(�}�q�t���#\0����HS,�ǝ���Ժ�A��p���\"�\r���g�3�N�o0|oǁ�X��@�\0D@^�H�3O�c�w��Fv��7��*��P|�DK������t�M7+8\09��0΋�����wk�������!��*B�P���}���� �n�fۮ���nVp\0r�#\0a�����K�[���� �E�o(��`�sKM���S�L�w�Y��@�\0�Y^���\n�cV�`��~�0�m\r������ֱ��N����t����m�ٽ���@�E�W�8ď�h�����+���k���k�J�#3s�s:\'\'M�����6���={6����^��yޮ}�v��O>�M�c����]�f���gg�Vg�yF��甔y��څ��hO��Z�l�����l�f G\09��yYk�m!~Li�°�+��U�l�j���={���9f3\\��?1�q�4��8���Z��ަ��V:�e��U�1�0�}Z.��-�eZ�\'םrJ���С=z��Y�g������^4���U]����;V��~+*�TMM����[�&O��3}qq����p��lҤ_��8qq?է�6lX��;�ܠ_�.n�[��v[��@Mw�v6�6���\n@�\0r �\"�w_�ǌ1��0n�=�j��n�?mw��g̘�ޫ�8�K���������#}^\Zr�i��Z�Ǝ�AM��f����z��z���?��WJ���_��ǲo3q�mzZ�����ii�׫k����{�y��x���ȑ�԰aC�����~ކ�Z����X�^�f�s��]nk����{���m�^�0�i�[j��:�lw����� /��ά�C���x\r�p{nՌs7������5����Ym6�s�i��j6��F�;Ʃ�ҍ��i�3���2m]]�JOOQ��.|Z_.��_����]x�Ul���<���שI�n7�j��yz�4��er�ii��m���e�����,�l��O���^�<gy�r���Z����z�.�n���隚m��o��f\r�����eMwG�mߦ��t���#���TEb)��v�ܶ�*_��7�!���k��C_/�=�MJzB�]W��JN��/�:����Y����=���u����_����4�YY��������?{��\'��[�o�}�ڲe���~W��С]�s��X��?��-R��[[���ٯ��h�k���L�n�[����;\"ɺ�>,cY��@�\0�Zl��@�4�[,�#���߾����R]~�Ŏv���;�I�.+��4�g�u�:��&Xn#�_r�`UP�G��~Z���[�W�zA_�o�v��8۶�S�\'�W������R�8˗\'�i]���=7������2���**r�����2���D�Ǐ�&#�e��#F\\������lݾ��QA���}���h���iiw[~�;�p���#��¼��֛)�x��I�U\\�i6�K�}�^���@UW8����]�L/�/���+ԁ;Tzz�n�kj��;��popn����s��ctC������&M��l�����e�3N�f߾m���}T�U*//�j��9�m���Wzݷ�?��o��ii����u��;�ذ��:��|��=M7��f G\09��y�(�Ǜ�\"�����l��/読-T˗?�c����f;_�{���zws��3��ON~J9��lj��\r�\"}Ycc�utr���o�}��\rw��K����яa��q^�lZ��kj\n��å��몪�q�������6���Ч��=K͘1�]�c7ܭ�\r�&��[��������ts�rVp\0r�#\0a�~��孖>\rwM�e��jZMj�JIq����ڹ��p�~�0��e*#�%������ܾN�C�fe����7���.�G֮໛=/�ǵ/�w����[[��X�ߦ��\\.����m�����=���������t����;ۭ�Nw C~����@X�e�Y��Pt����3H������J��Pa6�Ku�t�p�����ڙ���.�:_R�>�r��,�����75}�LSP�f6�������}P%&>b6�睊S�SM�6Q��*,\\�N;�u��^��f8��ߪk��T�����QW��u�����~.�a����[��j�<�����D�XimskͶ�Φ�ޭ}�SVp\0r�#\0ᑗ\\#t[ä!�\Z�3H��WSSUD��z�|C	�����v�M��x4۬�\0� G\0�(/��^n�f+��;!r.�}C�-ݾ�w�i�;����>��w�Y��@�\0�i^���j���V#���wr�]EuQE���O�y6�mi��Vn�O���#��ĘuЬ�t��Z�?(�g�RR]T���{�4������v��o���#��%D���Ŝ�f^�wB�� �*�.�(xC�������:X��@�\0�q^&Y�qgm�Ժ�G�a)��E%o(��twv�Vp\0r�#����l�-g��|�Z��}�j�b)UAuQE�JGwg7r�\09@���K������v���ַ\"�}��A�4��z�ꢊ�7��U�����\0rDQ^n�\Zo�-|���	��:ݺ�t�9� Ѭj�ўdD���[h�˩.�(|C	v�pv#g�\r�#\0��Ҽ0���Z�w�����fe�]�c�y)��E�o(mm���Ug}��\09@�\0��\rw�E�I������f�6@�\0�#��Dyý�ꢊ����n�,�r�䥻4�{�.�n��f�6@�\0�#��t\'�|�w\r\r�f�\nq}�U�>s���0���$�m�\09@�\0��m��C��K�p�Z�����Y����ka�O���\0r���᪫.[7g�T�,�B\\c�^�f�v���G\09@�\0�m�A��|�r��	m}ңG�\nsı0\0� G\0�@^�T��?,MJz�&8�5f�UK͗>���G\09@�\0���y�i�EE+h�CP��Kכ��A�.fa\0�@�\0�#��D��s�9��4�\'���ѣG��=���y�#\0� /ݷ�>���7���Nw�g�ڍ���}��� G\0�@^��A={~/���O=<e�-�7mz�`CC!\rs;ꫯ��[�����h����;��0\0� G\0�@^��K͚c�V�\Z�IW.��;���_q)�#� G\0y�y�� /\0X�y�#��\00�\0r��\0�\0r�#��\0`a\0�@�\0r�\0,�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�0` G\09�\0`� G\0y��\0�#� G\0y�y�� /\0X�y�#��\00�\0r�#\0�\0�\0r�#��\0`a\0�@�\0r�\0,�<�@�\0�\0,�G\0�@�\0����G\09�@^\0�0\0� G\09@^\0�0`�\09�\0`� G\0y��\0�#��\0y�y�#\0� /\0X0�x	\0r�#��\0`a\0�@�\0r�\0`a�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�[���j\'/l� G\0y�!f�Zi���2���\0r�\0��n��.2�/l� G\0y�!-4��xyX`�\09�����]n��6[�Y`�\09����]n��� G\0�@^\0t�L���,�r��@���h�x9X`�\09���c����,�r��@\'\Z�6@�\0�#��\0�*�z���̜8q����؆޽{��-*��ٳ�w��gÇ�h���Q��#rD��9\"/@7�lٲ{F�Y��̙����TC�W��;��%�cQQ�JL|N\r8����{͗�bVp�E��9\"G��#�D���W����O%%��\\�Fsa�D��JN^�����թ��z+8�\"G��#rD��y�x�|������B�[*DU^^������{�~�\"G9\"G��#rD��Э,[�����h���py�ҥ/�1cԨQ׫믿F�?R%/Jj6��*/߫N9�/��ߝO�#rD��9\"G��#�tr ��#��OJz�<��W�X�T���(u�-cu�s����V\rz�Z���P�T���?�իW+8�\"G��#rD��y�DJ�11?R.W���h���Q�z�|�\r#���ϮSÇ]i.�c�MOu��>��O�Y�\n9��9\"G��#rD^�(0qℽs�<i.�nV#�ǩ�WYoe����\'�W��/��.ח~oG���M�w�9KY�!G9\"G��#rD��bc�4�����fu�����~��nyGe�i�Z�j�Z��F}\\������շ�~��vT���ws��d\'+8�\"G��#rD��y�@�޽UC��悡�Y=6�!U\\�E�(ުv�*�%�w�خ{�!����_2�Y�b�Q��#rD��9\"/@���(�e�r���f͚���f�*))T���ѵk�5���V3�O}���~oK���|���9\"G��#rD��y�Y�]�U����u�^S��?U�U����U���j�嗪�W����Ϛݞj��C�(rD��9\"G�� ���p��6��aCcUMu�z�l��ݼQe��G���J���K�B;M�t啗�����o�����\n9��9\"G��#rD^��Z0sj�M�7ea���Y�����+�/Q//^��^xV=3�i}���/-T�^3Bm|{��}P�/Vp�E��9\"G��#�DՂ��N=6�w����\0^��Xג��U����y��>����#j�ߪ\'�x�\\(g��ͼ��>��+8�\"G��#rD��y�j���S�`��������i���,���?G͝�z�ٹz�,�1��朷��T\'+8�\"G��#rD��y�j�|ԩ�{��G��~y�8���]��U\\���	�������z���b�Q��#rD��9�\"Y�sn�v\Z\0�]0�U�o�����S����*a�uj��+�СW��+����������G;�=�����+8�\"G��#rD��Qb�;���{���&�\n9��9��9\"G�e��l�Ջ�	z��&�\n9��9��9\"G�\ri��G��k�|�\n��╀�K G9\"G��#rD���r�w�ٺ\r�o��7*L*JWp���¬$��rD�#rD��9\"G�(l��.7��ڿ`>D�IE�\nN��J�lQ�,\nڌ_rD��9\"G䈊�e\Zl�:k�|�\n�����\0[�p���#rD��9��)Gq\rw�~Ղ�\0&E+8	�����\'�#��#rD��9\"Ga��.7[���-��J�IE�\nN[W^�i���#rD��9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM���Z*L*\nVp��R���\"G�\"G����%?��k5֪��o�Z)�M�O�0�_�i��]]���0~�9\"G��#*�rcVvM���j��T@���T�T��ttw�Hߝ��K��9\"G�Q�����H��ͳ�j�\'�u�Y}�i��5Ⱥ��n�%\\>�bk7x��*L*BWpZ; M���#rD�(rD�(r���w��t��������}�{2��w���\n�����>�k�nY`��#rD��9\"GT$�h�O�\\i��f��ܮܧ�fK7�|��I�K�߶m�����>}�����奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'���;7��55������@׆\r����s�߷o���%%TYY�>-?jVr�͞����9���*�~}#h��`�{f�i�\r���\"��5����:�E���9�1�w#��_���}��湆���h�\0�����JK��A���Qze_N�{���3�<C-\\��3����<o߿�?�k��ӧ�TK�-��t�\rm~n���P]}ul��Hc �TW�����n6,����^��~o�\'ޢ�l���F�?����;~�rs_�Ӗ����/X�^.��X�.��B}�}����/���s���O�e�d�������v���C��9\na��_�QQ�#�Ƹ��mϦ�ܧ�p|�\\�j;V�t��;����̗��={���w7\n?�,=}��R��\\i�b6\n��[���\"��MM��>�:�����#��G��V����KJ2u3Q\\��.�����{��W����׿�L�r}���e2�<�Çw���g�i�����5k�UL�\0�6r�����m��ߦ�������:���#p�ư�x�NԖ�ϕ�&z\\Iߡ#G��(GTh��#*�r4�����ŝ|�޻��k9p|��q�UW��\Z0����Z�N9��z��{Un�:L�&ݪO�{n����{���^�F��JM�2�\\YN�ӟv�)fðPUW��=vS�{7Si6ZzN���ر�9�e��i�y�fz�i�zk�}�>���R���#GJ�i+*6��jk���������h��F�����w�u����ѧ+��}�ܻ��sh�����@+�VVZZ��7}���#�;t����\n]�#rDE]�<�n\'���x�`+7�o�\\�b�Օ�7�������o�Sa�\ZU^�Q�w�����-s��yy�Y������@��g�[֖�ș����\'%ӧ���9�a��*&�_��)j�������K�ٳp�+.^�o/[�<��w��l64���V�Y����=--ɹy}bc�]M�6�l2���4����Yg�i6;�m�ױ��#D�X�Ib���JN[Wn|Wr�bw���V����\n]�#rDEU�Ƿ>���\'����\'�bh�\0�`��M����:��tðj�szW҇�������_{Zw�p�>�o_��$��46V�@�-��}���V�nj����e�e�&�2ْ8b��^�ee-ѻ�N��_jҤ[t���fd���y:T�ܷ���@n#M���I�\\���������7����ȑ��X�[�_B�`�G�qm�M[W2Z[�	v����?�-m}��9\"G!�u��#*�rt��tY\'����x���Z�^0W�XlS��+Ե�ƪo�Z��;��y�TS����LΗ��ӷ����lke�Roɒ����W�[�������rz��GZ|~2���3�]v��	^�mܸT�Ծ�ꫯpNoذؙn��=�\\����[U����V9�;1�!����ܦ�~���~}������T�q23SZ�_B�`�+��OF�ݍ.�JN�v���n��JN[_+rD��Qr�9��m{�Ɇ���t2��C�ɓow> :�A�R�������nѷ�|<ɩ��(/[_�r}����8U]�Yh���!��y^2PS���\'[}m~�7�i���ٳ>�טEw��2�孜��Y�O��tɃ�3�}̾���Y��	���� e�9����%���y����S����O=�S��-[^WӦ�Z��=�Z�q��ȳ	�t����6�@�4��XMM�+�yY�-t7�t���m~i\n.����;z��\\`�h�^z�����\\�{l�l��_9竪6y4�Gv;���w?�V=�u��X��\'���z�\n�+�n?l�e�B6C_�����~>���������On�r������lY�/��yy���Zwт���\\�ii%��+7}>\'��\"G�� GR2f}��̦y�u���ԧ�G�̙��^\"�o/{V�?�\n�!{�c������̀�=��T}��d�:v�Թ����)V��/�LH�/������)S~�d�^V�ʿ�_�&ݬ��^\'qq���R6�d}����\\9�9�f���nK����Q����������s>�O��g�1�>�Ƈ�����>��=�\'L�����Z��7�ͯ�1j�7���5�y^�Ϟ�[��Aɋ��}ʰ���!]����Ӳ�\r��\'��W�o���W�^6���m{_�0�Q������3��>��􂹲MU]������m����B텤�45U8ӺWr��m��o���)��6��~��q7lH���|�����\\.�ᬳ�?���#E����^e�����y.���\nG�nt����}�����칤�=�Zu��N������i�^�&%=��oh�km���&S`�i�c�<c6U����]�`��d4�>����ӑ�ߕ��0z��9\"G!ȑ=�d{�oY	��2`��d�YƗ�)�1�z�sz\\�tr�B�{����͛�5�dѾ���>?�O�s���c��r�iY�_y��X[��%k�m%s���s���P��~�^�ع��8����jtr����ܨ���,��Q���6�g��/�̖�26导\'�u����G9/����cGz5�vfKJ�����%K�V^�#=N,x�:F�.�$W9�CƬ���>���j٢�!�m��]�[�r������:�r{����sb��ط���&c�+��}O�����X\r�Z�^0�b������S�;�m����22�9/+\n�\n�}^V��O�S7�%��W�e�Ç�镆�´��A�s�|���z��SO��l��ҵ�\'�����oP۶��[�,x��={�t�X<�����Rsee�����w���^��ۗK54�\rD�>���L�5�wO��\Z�Ն�f�+��㫇�-	U���n�9\"G����H�р�d�Կd��=F���4Ş�q��\Z5j����q��z��>�܏d���7������9\r��!?T_����O�_y�C��6��<\Zˬ�g<�p\'�-𞙐9R�˽5o�>-9����e\Z��|�f/+���ݤ����~�R���\0��yE���^��c�J�=w�1F�?45��l�ȴ�Qϲ����-�k�f���62��v�����RS��Ǫ����Iv��&�����ͼ}{�~�GN{��~��R��lL���7�/~�y���<�}������~< �����]��Z�.�$t�����5]kG������.j8oQ�}��9\"G\'8Guu;�ߍ��Z\Z�}�r���͕����x��x��>������\n��ݫ|777�j�+Z��\n�t�sؿ�k��G�i��2�-v+�cef��:/_>�l8�\Z��V����Ho�4��k<K�a?W�9������o�K�c?vi�\Z���.L�x?jӼ���h��g\\�������II��d,\'\'?f}�i��]�)z7u{z{��l��dڳ���j=��s�p����L�m�C�a�.�z�����󹺛��˔������z�^��������3�y�~?�c7Х\r��T�T-�}߬}W&�����t�w��V�_rD�B���֑̅�_R�V=c���P?|�>�>��Kδg�y��$_�O�۷�i��i\Z�(����}��\n���c��뮛��>��^�=Zh�6[l����-��}ڕ���\\y�o6>��w7�������m�^k6��?u���ɷ����_�LW\\��&L�4#��o����9\"G���T]~��9cMƿ�.+{�K���9眭����3NdO-s�ɳ��S�G_��i�ݲ7;e����֖�uVS��߱g�[;c�yi���fO�z�|���Ը�Pˇ\0˗��_SZ��I�q[z<C�R��ܯ��ƕ\r�G|��چ�<�����s��nG�ӯY��9�ظ�:�ҫ��.%�V��*����Y�%�K�Ef��bӑO��Ԋ�����ӕG�m����1���XgBN=�=�t����bN<���<����2�JԆ\r������UFF�3���^�n�q�����g�Ӿ�\r�ܑ��̑�ai���)��Νfm��_M�r��,����oc7ܕ�oY�-3���><ǝ���־�W�����ͼ�3����[��������\'�+��j֬�8�%+�G�l5����Ƨܷ�?r��=v�H_�;��(�h����*��=�˵�Yn�����s���~䯊�_w>�1,�rWWo���kL��d����\'cW� M����{k8���\'�\r�X�������I�n�e���\r\r�����\nW�ol۶�j��[�|���`���[�7��r���9c_��w����s��F�Ο?�����hy?�(�@�6�JJ��&y�Z�`��}���J���|s%~����d-����\\����>�r��Hț����f.�S��v��t3.���i)Y`�w9��oY�+��M�лC��9-ׅ��	т��-�$���5m�wQbt�����_U�e5�/;㡴4��t��;��˸����*-�Y�\"#Y���[�\n��$&>�?���O�e2�)��s�-���o���?ֹ#Gљ����z�o��7�֑�G:��-i�%��o�\r�6�Q��u��I����]��q��Y�?�A���t7\r�f�����~L{zόUTd���1(�m��G�l��#�s�ǲ�*���H��;�%��t�\'ߢO���G͘q���r�\\��O��k�]e߱v�\"G�����?��1C�L�z���[>ܲǅ��w��ȑ-zN��2;[r{C�u��lj78�p�W?��س�Θ</{QƱ�������G���l�߳��Iɠ����ڙ�S�F����\rtm�]�:|�@��76��rҟc}j��^��+���~G��k�LŃ~����~�s�}D��Ӻ��:E�nh(QYY��6s��g���������Դ\'$����h���Vn�v��ػ��������9/[�������m��/ԧ��.,\\e�Hqn�^��u���^+��I�;�\'�՗ٗK�`�FV�d�Ai:�oyx�Z�ʲ�l��#Gѝ#�x�1{��>\"��sܸ�p_�?t��y�}�~��G�nu��é�o�Y�qe?����uw[�$yq7ǧu7�e�����޲eE��]��ƶ�����Ƿjɸ��s�2��6���w�#ޏ�w{l�x��C��ǹ^Ɨ���j�2�SS����fF������(�_w��s]��3���L��eek�_�Hu��l�1���~�;�ƨ�.�u����{��r�����\Z�L\'��л��\Z��G�rY��e�?���m��{���{CZ�¬�2��t��d[[����f��y�b�wC�s!�N7�vs�r�}���mݠ���c��:/�!o�����6a>^mYh��M�+9�㍋��;i7��|Ĉ˼.��v��̕�_蕓ŋ�[�g̘�\\f�-=��GY�\ZsE�sf������Y�b=��i��9�![4|W��i��-��p�9����n�ͳ�C(�e2�/��_���>a�_��ek���t6<Kn�a���Ǖ��i�~�)w~���d���q���_�+u�՗7{_��H 9�i$��(��\r�D��.	8���S�Fr�����9?~ݨQ��c�%_������,���^���W�ƅ�{������i�k��~c�_��,�͂3���^q�kN�|�+�\'r?��ؙV��r�i�=s\"������+Dꩧ�q޿쪨x�y��p�C��(x?���\'�1��x���Y��`����ۮ�DL�6^/e��oߟTj�z!w�H���k��^��z��z\ZC�f��^IZ��q��8]_����Z��y��hl,�>�}A�����a?��\\�����Ȋ�l-,.^e��,��c?�3�e�ww�;�����J�� �`DM�rs_6W���۪Usu�;cƯ͕e��`i�l�d��l�iu7���2�%��e�r��a��?�*/_�l�WU�w�}YI�����D��ڽ`OX�u�55�\n�2��+��/9��G�������,G�<Ʒl��샧]lߊ.5�6p̻CV.�Ns��s���us!Wj�~���L�[����u;�\'�����FkW����nd��E���n֧�I���^Ӯ^=�����1xQ߿}{����14��9�W��-�++mY�1Z�](j�KsTW�M�{���\rI���QU�i6�;������y����FX�5]m�&�_���7������z��x����<>�L�E�n˖ea�;r��rD�~D��9j�|����輟��+7��n�2\0��]!��z�o#�x�p�)x�j&޴v�K��o\"�����x�9=u�m�������\"}Z�}D���._���}o޼�����\"��<������rrC��D�\n��J�����F�?��{����jD����m�}��n��@�p��؋ԤIc�8�1{����&��o[߁]�wCN�J��/��_������s�2���#t�~��6w�Q��#��c��\n�l�;�tK������`-�`.\rY56y4��ֵuցd^q�𼼗�nw��.UG��<s�)\'�\rɖf�a�#�ƚ+��-m��i�]\'8����I�\\;�Ͼ�455��ϖ�����!Z��\'�Vp���tƖ��8�kX��ȑw�,��mۖY�������4�,��^-jv��V�V+W>�����\n\n��\r��A�LUWg6�y��o��=�K��Q����9b�����vy��-[�ۻ{���s�6��]�`nhp�\\��j���\n�{�[�nrr^�������q�f$#�9\'�l\n����ima8a�ϝ�\'GT���x�:���`%��W�\"*Gv6��穦�}��`ذoq�H��{YVVR�i���z^��h;;�;C�Ν��1,��uC�&���4��2w�������#r�&�|�n9-R�����t��܇�#�V@�4ܲUK�{n���m����M�������������o\Zy�����Eo}��\"�-���co	��nw���^�娴�5��j{���Y��r>�ji�ػ��w�^h횝�wz��JK��#��$2��6)�A�\0kl�8��ܑ��#��#rD��QP�[c]�4�YVC.[����e��A�m�0ܻ�{ޮκ\r��`��vt\Z�A���E �H69\n��N�#G�\"G�\"Gmcx��=���;�\0f�!�nx���9\"G��#rD��h��mV��\n�ўdp4r�3�]�b�wA\ZG�(rD��9\"G�u�f=`�Z�>1����阮{w�{�8\0�,��P�������E��\r9\"G��#rD��h�\0�,�#h�B��G��9\"G��#��\0f�a���+7��#rD��9�h��`f�ܥ+9IQ�rC��9\"G��#��\0f�]&����E��9\"G��#\04���ՇQ��#rD��9@�M�`9\"G G��\"G\0X0�`9��9���9���b�L�(rrD�@��\0�f�#rrD�@�(r�3f�#rD��E��E�\0�`�X0�#���#�#r�3ł���#�#�`�̂��Q�Q�\0f�39������.\'�|�w\r\r�,à��j�>s����\"G�\"G G�@<�Ǉ��`�Z�����Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K��\"G�\"G G�@0����˵��c��\'=z��0gI��Q�1���9%���aiR҃,��ƌ�j�9+r��\"G��#�#r �:���ꋊV�����_�ޜͺ��H�(rD��99\"G\0�O�9��wΡ_(��ѣ�|��0�E�@���9��N���y����������X�d�L�(rrD�@����aPϞ��9��SO�r��M�^<��9v��1�OD�Q+�i�w{�݈Q����#\0�̥f�1k�Y\rf)���2ܿ�(?�Q+�E�@���9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����9���6BX\0\0\0\0IEND�B`�',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','1',1),('schema.history','create(5.15.1)',1),('schema.version','5.15.1',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('bfbf91e71b594f758116859ae838df75','SpringAutoDeployment',NULL,'','2016-06-02 09:03:44');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('test_audit:1:d6e6b5d8555341d5b434d2b749c263d1',1,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'bfbf91e71b594f758116859ae838df75','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `cabinetms_model` */

DROP TABLE IF EXISTS `cabinetms_model`;

CREATE TABLE `cabinetms_model` (
  `id` varchar(64) NOT NULL COMMENT '模版ID',
  `no` varchar(64) DEFAULT NULL COMMENT '模版编号',
  `name` varchar(64) DEFAULT NULL COMMENT '模版名称',
  `address` varchar(128) DEFAULT NULL COMMENT '模版位置',
  `product_id` varchar(64) DEFAULT NULL COMMENT '产品id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_model` */

/*Table structure for table `cabinetms_notice` */

DROP TABLE IF EXISTS `cabinetms_notice`;

CREATE TABLE `cabinetms_notice` (
  `id` varchar(64) NOT NULL COMMENT '消息ID',
  `notice_no` varchar(64) DEFAULT NULL COMMENT '消息编号',
  `notice_name` varchar(64) DEFAULT NULL COMMENT '消息名称',
  `notice_content` varchar(200) DEFAULT NULL COMMENT '消息内容',
  `status` char(1) DEFAULT NULL COMMENT '消息状态',
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_notice` */

insert  into `cabinetms_notice`(`id`,`notice_no`,`notice_name`,`notice_content`,`status`,`starttime`,`endtime`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('4875f7cabcd74895a6a47f05adcc0c0b',NULL,'测试消息名称','消息要播放的内容','1',NULL,NULL,'1','2016-10-26 09:53:00','1','2016-10-26 10:06:26','测试新增','1'),('617833b00e984ca48a7341a6a1ecfff8',NULL,'1','1','1',NULL,NULL,'1','2016-10-28 09:33:27','1','2016-10-28 09:33:27','1','1'),('771883cdcac94513b2673edf5fc68880',NULL,'中国高铁','据美国《华盛顿邮报》网站9月29日报道，中国媒体消息，中国政府计划在最受欢迎的一段长城下面修建世界上最深、最大的高铁车站，作为将首都与2022年冬奥会场地连接起来的规划内容之一。','2','2016-10-28 09:41:59','2016-10-28 10:42:03','1','2016-10-12 21:24:39','1','2016-10-26 10:36:03','修改测试','0'),('b2cdc89a92e246be90b1f73fdba538d1',NULL,'1','1','1',NULL,NULL,'1','2016-10-28 09:35:49','1','2016-10-28 09:35:49','1','1');

/*Table structure for table `cabinetms_program` */

DROP TABLE IF EXISTS `cabinetms_program`;

CREATE TABLE `cabinetms_program` (
  `id` varchar(64) NOT NULL COMMENT '节目ID',
  `no` varchar(64) DEFAULT NULL COMMENT '节目编号',
  `name` varchar(64) DEFAULT NULL COMMENT '节目名称',
  `model_name` varchar(128) DEFAULT NULL COMMENT '模版名称',
  `title` varchar(255) DEFAULT NULL,
  `program_file` varchar(2000) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_program` */

insert  into `cabinetms_program`(`id`,`no`,`name`,`model_name`,`title`,`program_file`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('05fa9c0c82c842ac9f004992f4639c36',NULL,'视频节目','video','视频节目','|/userfiles/1/files/programFile/2016/10/h0134j6z7lp_m701.mp4','3','1','2016-11-30 17:16:27','1','2016-11-30 17:17:53','250地址','0'),('2176957c2659498b9029a6b1f7d60bab','','侯轶测试文本','txt','测试文本','|/userfiles/1/files/programFile/2016/10/11.txt','3','1','2016-10-27 08:40:51','1','2016-10-27 09:20:20','','0'),('3f12c11090cf4e178eb5f8c2fef10d75','','侯轶测试图片','image','测试图片','|/userfiles/1/files/programFile/2016/10/2841_727834_702932.jpg|/userfiles/1/files/programFile/2016/10/2841_727923_693893.jpg','3','1','2016-10-27 08:41:52','1','2016-10-27 09:20:20','','0'),('6cac801da7e345a495135ec21649ad21','','侯轶测试混合','mix','测试混合','|/userfiles/1/files/programFile/2016/10/2841_727923_693893.jpg|/userfiles/1/files/programFile/2016/10/2841_727834_702932.jpg|/userfiles/1/files/programFile/2016/10/oceans.mp4|/userfiles/1/files/programFile/2016/10/11.txt','3','1','2016-10-27 08:45:33','1','2016-10-27 09:20:20','','0'),('8b0938372b534bc0a5b4f74ecada7e8b','004','马蓉综合新闻','mix','马蓉综合新闻','|/cms/userfiles/1/_thumbs/files/programFile/2016/10/01.png|/cms/userfiles/1/files/programFile/2016/10/01.jpg|/cms/userfiles/1/files/programFile/2016/10/02.jpg|/cms/userfiles/1/files/programFile/2016/10/03.jpg|/cms/userfiles/1/files/programFile/2016/10/04.jpg|/cms/userfiles/1/files/programFile/2016/10/oceans.mp4|/cms/userfiles/1/files/programFile/2016/10/%E6%96%87%E6%9C%AC%E5%86%85%E5%AE%B9%E6%B5%8B%E8%AF%95.txt','2','1','2016-10-24 13:41:42','1','2016-10-25 11:28:10','','0'),('a04e40da6d274b0f91909fd793b8e714','','侯轶测试视频','video','','|/userfiles/1/files/programFile/2016/10/oceans.mp4','3','1','2016-10-27 08:44:43','1','2016-10-27 09:20:20','','0'),('c9b7742b2de745dba7f659022f2f9e8f',NULL,'111','video','111','','2','1','2016-10-28 10:58:52','1','2016-10-28 11:51:35','','0'),('cd81c42567c54dd18c3b602b1c666ee9','003','马蓉聊天截图','image','马蓉聊天截图','|/cabinetms/userfiles/1/files/programFile/2016/10/01.jpg|/cabinetms/userfiles/1/files/programFile/2016/10/01.png|/cabinetms/userfiles/1/files/programFile/2016/10/02.jpg','2','1','2016-10-21 15:47:43','1','2016-11-30 17:16:51','','0'),('df5afa8064494052880fad6052dd47a8','001','文本节目测试','txt','王宝强新闻','|/cabinetms/userfiles/1/files/programFile/2016/10/%E6%96%87%E6%9C%AC%E5%86%85%E5%AE%B9%E6%B5%8B%E8%AF%95(1).txt','3','1','2016-10-19 10:31:02','1','2016-10-26 10:48:32','','0'),('f835f96b0e21449388e56d255073e665','002','王宝强庭审视频','txt','王宝强庭审视频','|/cabinetms/userfiles/1/files/programFile/2016/10/%E6%96%87%E6%9C%AC%E5%86%85%E5%AE%B9%E6%B5%8B%E8%AF%95(1).txt','2','1','2016-10-21 10:17:47','1','2016-11-30 17:16:50','','0');

/*Table structure for table `cabinetms_program_tactic` */

DROP TABLE IF EXISTS `cabinetms_program_tactic`;

CREATE TABLE `cabinetms_program_tactic` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `no` varchar(64) DEFAULT NULL COMMENT '策略编号',
  `name` varchar(64) DEFAULT NULL COMMENT '策略名称',
  `starttime` int(50) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(50) DEFAULT NULL COMMENT '结束时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `status` char(1) DEFAULT NULL COMMENT '策略状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_program_tactic` */

insert  into `cabinetms_program_tactic`(`id`,`no`,`name`,`starttime`,`endtime`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`status`) values ('5d21a3bac15446eb98cb9c9af1203b8e',NULL,'侯轶测试',20161028,20161028,'1','2016-10-27 09:20:20','1','2016-11-30 17:12:31','','0','1'),('d278ffbf2927477dab9354615bc14556',NULL,'test',20161130,20161130,'1','2016-10-26 15:31:20','1','2016-11-30 17:28:38','111','0','1');

/*Table structure for table `cabinetms_program_tactic_detail` */

DROP TABLE IF EXISTS `cabinetms_program_tactic_detail`;

CREATE TABLE `cabinetms_program_tactic_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `program_tactic_id` varchar(64) DEFAULT NULL COMMENT '节目策略ID',
  `program_tactic_name` varchar(64) DEFAULT NULL COMMENT '节目策略名称',
  `program_id` varchar(64) DEFAULT NULL COMMENT '节目ID',
  `program_name` varchar(64) DEFAULT NULL COMMENT '节目名称',
  `starttime` int(50) DEFAULT NULL COMMENT '开始时间',
  `endtime` int(50) DEFAULT NULL COMMENT '结束时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_program_tactic_detail` */

insert  into `cabinetms_program_tactic_detail`(`id`,`program_tactic_id`,`program_tactic_name`,`program_id`,`program_name`,`starttime`,`endtime`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('257424e28cf74e67a3b7137e537d8bac','d278ffbf2927477dab9354615bc14556','test','05fa9c0c82c842ac9f004992f4639c36',NULL,171900,172145,'1','2016-11-30 17:17:54','1','2016-11-30 17:18:09',NULL,'0'),('33f2a62696e246b1bca1f815e7200a45','5d21a3bac15446eb98cb9c9af1203b8e','侯轶测试','2176957c2659498b9029a6b1f7d60bab',NULL,95000,100000,'1','2016-10-27 09:20:20','1','2016-10-28 09:49:55',NULL,'0'),('51b78caccdbf4d0eb450ec9c78509b61','5d21a3bac15446eb98cb9c9af1203b8e','侯轶测试','6cac801da7e345a495135ec21649ad21',NULL,94000,95000,'1','2016-10-27 09:20:20','1','2016-10-28 09:49:55',NULL,'0'),('6cbfb5c9eee54d8aa7a4f635005f53a8','5d21a3bac15446eb98cb9c9af1203b8e','侯轶测试','a04e40da6d274b0f91909fd793b8e714',NULL,93000,94000,'1','2016-10-27 09:20:20','1','2016-10-28 09:49:55',NULL,'0'),('ab38e90c1fb0410b9d3fa30e6719b983','5d21a3bac15446eb98cb9c9af1203b8e','侯轶测试','3f12c11090cf4e178eb5f8c2fef10d75',NULL,92000,93000,'1','2016-10-27 09:20:20','1','2016-10-28 09:49:55',NULL,'0'),('e67b2f6eadb945cca9b30fbe37c82dcd','d278ffbf2927477dab9354615bc14556','test','f835f96b0e21449388e56d255073e665',NULL,152900,153000,'1','2016-10-26 15:31:20','1','2016-10-26 15:31:20',NULL,'1'),('f9869fc7edec48cf9e893fa56dec174b','d278ffbf2927477dab9354615bc14556','test','cd81c42567c54dd18c3b602b1c666ee9',NULL,153130,153200,'1','2016-10-26 15:31:20','1','2016-10-26 15:31:20',NULL,'1');

/*Table structure for table `cabinetms_terminal` */

DROP TABLE IF EXISTS `cabinetms_terminal`;

CREATE TABLE `cabinetms_terminal` (
  `id` varchar(64) NOT NULL COMMENT '终端ID',
  `terminal_no` varchar(20) DEFAULT NULL,
  `terminal_name` varchar(20) DEFAULT NULL COMMENT '终端名称',
  `terminal_ip` varchar(64) DEFAULT NULL COMMENT '终端IP',
  `office_id` varchar(64) DEFAULT NULL COMMENT '机构ID',
  `program_tactic_id` varchar(64) DEFAULT NULL COMMENT '节目策略ID',
  `notice_id` varchar(64) DEFAULT NULL,
  `screenshot` varchar(255) DEFAULT NULL,
  `status1` char(1) DEFAULT NULL COMMENT '终端状态',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`),
  KEY `idx_ip` (`terminal_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_terminal` */

insert  into `cabinetms_terminal`(`id`,`terminal_no`,`terminal_name`,`terminal_ip`,`office_id`,`program_tactic_id`,`notice_id`,`screenshot`,`status1`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('248323ff04a74099a9ebec1a6b56b314',NULL,'展厅2号','10.2.0.196','412371e480224ebab130c5cd1377bb59',NULL,'771883cdcac94513b2673edf5fc68880','/screenshot/20515bd5996543e8b2bcc85d6e98366b.png','4','1','2016-10-24 09:55:18','1','2016-12-01 10:03:00','','0'),('30ac09c2b2d0402a8503b6e5d24a2710',NULL,'侯轶测试','192.168.1.102','0acd4c2f5fe142258edd4ab5ffe6ad5b',NULL,NULL,'/screenshot/d6560919860e4aa49991741974d4192d.png','4','1','2016-10-25 22:37:49','1','2016-12-01 10:03:00','','0'),('871c18f43c1a4992bfade17600bdddea',NULL,'本地测试','192.168.44.250','e14a7b00f5b74aaea989e5f5e724dfed','','','/screenshot/null','4','1','2016-10-19 11:02:55','1','2016-12-01 10:03:00','','1'),('a126e62f691c4120942ab18a37ddd003',NULL,'展厅1号','192.168.56.1','ca5664b3b80f48759a30217dd440c2cd',NULL,NULL,'/screenshot/788cba56f9274aaab65365a21c3dae7c.png','4','1','2016-10-12 21:41:37','1','2016-12-01 10:03:00','','0'),('dbe6384f09194f5da61053a24f11e826',NULL,'外网ip','114.115.209.238','4e9ef144a37b410097df2100ec0187d5','b053f388745e4db48e687f778070a6ee',NULL,NULL,'3','1','2016-10-25 14:24:21','1','2016-10-25 16:07:03','服务器的ip','1'),('e88edf5f3995495cabcd368320e5364e',NULL,'小胡','192.168.44.110','412371e480224ebab130c5cd1377bb59','',NULL,NULL,'3','1','2016-10-25 14:01:05','1','2016-10-25 14:01:05','测试终端ip','1'),('f42db5f0fc1549cabe7190d0e83bf928',NULL,'我的笔记本','192.168.1.101','412371e480224ebab130c5cd1377bb59',NULL,NULL,NULL,'3','1','2016-10-25 19:10:05','1','2016-10-25 19:10:05','我的笔记本','1'),('f93516591dd049809b9a051263083984',NULL,'我的办公室','192.168.44.250','4e9ef144a37b410097df2100ec0187d5',NULL,NULL,'/screenshot/null','4','1','2016-10-26 09:30:11','1','2016-12-01 10:03:00','测试终端','0');

/*Table structure for table `cabinetms_unit` */

DROP TABLE IF EXISTS `cabinetms_unit`;

CREATE TABLE `cabinetms_unit` (
  `id` varchar(64) NOT NULL COMMENT '机构ID',
  `no` varchar(64) DEFAULT NULL COMMENT '机构编号',
  `name` varchar(64) DEFAULT NULL COMMENT '机构名称',
  `type` varchar(64) DEFAULT NULL COMMENT '机构类型',
  `address` varchar(128) DEFAULT NULL COMMENT '机构地址',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cabinetms_unit` */

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `content` text COLLATE utf8_bin COMMENT '文章内容',
  `copyfrom` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values ('1','文章内容内容内容内容','来源','1,2,3','1'),('10','文章内容内容内容内容','来源','1,2,3','1'),('11','文章内容内容内容内容','来源','1,2,3','1'),('12','文章内容内容内容内容','来源','1,2,3','1'),('13','文章内容内容内容内容','来源','1,2,3','1'),('14','文章内容内容内容内容','来源','1,2,3','1'),('15','文章内容内容内容内容','来源','1,2,3','1'),('16','文章内容内容内容内容','来源','1,2,3','1'),('17','文章内容内容内容内容','来源','1,2,3','1'),('18','文章内容内容内容内容','来源','1,2,3','1'),('19','文章内容内容内容内容','来源','1,2,3','1'),('2','文章内容内容内容内容','来源','1,2,3','1'),('20','文章内容内容内容内容','来源','1,2,3','1'),('21','文章内容内容内容内容','来源','1,2,3','1'),('22','文章内容内容内容内容','来源','1,2,3','1'),('23','文章内容内容内容内容','来源','1,2,3','1'),('24','文章内容内容内容内容','来源','1,2,3','1'),('25','文章内容内容内容内容','来源','1,2,3','1'),('26','文章内容内容内容内容','来源','1,2,3','1'),('27','文章内容内容内容内容','来源','1,2,3','1'),('28','文章内容内容内容内容','来源','1,2,3','1'),('29','文章内容内容内容内容','来源','1,2,3','1'),('3','文章内容内容内容内容','来源','1,2,3','1'),('30','文章内容内容内容内容','来源','1,2,3','1'),('31','文章内容内容内容内容','来源','1,2,3','1'),('32','文章内容内容内容内容','来源','1,2,3','1'),('33','文章内容内容内容内容','来源','1,2,3','1'),('34','文章内容内容内容内容','来源','1,2,3','1'),('35','文章内容内容内容内容','来源','1,2,3','1'),('36','文章内容内容内容内容','来源','1,2,3','1'),('37','文章内容内容内容内容','来源','1,2,3','1'),('38','文章内容内容内容内容','来源','1,2,3','1'),('39','文章内容内容内容内容','来源','1,2,3','1'),('4','文章内容内容内容内容','来源','1,2,3','1'),('40','文章内容内容内容内容','来源','1,2,3','1'),('41','文章内容内容内容内容','来源','1,2,3','1'),('42','文章内容内容内容内容','来源','1,2,3','1'),('43','文章内容内容内容内容','来源','1,2,3','1'),('44','文章内容内容内容内容','来源','1,2,3','1'),('45','文章内容内容内容内容','来源','1,2,3','1'),('46','文章内容内容内容内容','来源','1,2,3','1'),('47','文章内容内容内容内容','来源','1,2,3','1'),('48','文章内容内容内容内容','来源','1,2,3','1'),('49','文章内容内容内容内容','来源','1,2,3','1'),('5','文章内容内容内容内容','来源','1,2,3','1'),('50','文章内容内容内容内容','来源','1,2,3','1'),('51','文章内容内容内容内容','来源','1,2,3','1'),('52','文章内容内容内容内容','来源','1,2,3','1'),('53','文章内容内容内容内容','来源','1,2,3','1'),('6','文章内容内容内容内容','来源','1,2,3','1'),('7','文章内容内容内容内容','来源','1,2,3','1'),('8','文章内容内容内容内容','来源','1,2,3','1'),('9','文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) COLLATE utf8_bin DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`parent_id`,`parent_ids`,`site_id`,`office_id`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`custom_list_view`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','1','0,1,','1','5','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','18','0,1,18,','1','5','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','1','3','article','组织机构',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','1','0,1,','2','6','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','1','3','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','1','3','article','质量检验',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','6','0,1,6,','1','3','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','6','0,1,6,','1','3','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','6','0,1,6,','1','3','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '留言分类',
  `content` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '留言内容',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '电话',
  `workunit` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '单位',
  `ip` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '链接名称',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点标题',
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) COLLATE utf8_bin DEFAULT 'default' COMMENT '主题',
  `copyright` text COLLATE utf8_bin COMMENT '版权信息',
  `custom_index_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','默认站点','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','子站点测试','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `gen_scheme` */

DROP TABLE IF EXISTS `gen_scheme`;

CREATE TABLE `gen_scheme` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

/*Data for the table `gen_scheme` */

insert  into `gen_scheme`(`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('01648a8084334605b87abcd91ce777c6','消息信息','curd','com.cabinetms','notice','','消息信息','消息信息','houyi','653312ea727a4b7b968dae0050cacec3','1','2016-10-11 22:14:54','1','2016-10-11 22:15:27','','0'),('136b990464784bbc984df0793c7ae8b4','节目管理','curd','com.cabinetms','program','','节目管理','节目管理','付殿东','3f425f78513e422ca5702f763702e452','1','2016-06-06 17:11:21','1','2016-06-06 17:11:21','','1'),('1a74d340b5a242d481a2d23f77d42b8a','节目策略详情','curd','com.cabinetms','programtactic','','节目策略详情','节目策略详情','付殿东','930ddb18b8644d72a6c8310f06e452f3','1','2016-06-07 15:36:19','1','2016-06-07 15:36:19','','1'),('3159fbff95334fb1be07f6ead2e762ed','节目管理','curd','com.cabinetms','program','','节目管理','节目管理','付殿东','3e3bc34c17c94921aedbb6fa694410a5','1','2016-06-08 15:39:35','1','2016-06-08 15:39:35','','1'),('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','test',NULL,'树结构生成','树结构','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('39dafa174572449093ff2f43b9713fe7','节目策略','curd_many','com.cabinetms','programtactic','','节目策略一对多生成','节目策略一对多生成','于滨','62a4e76746c54afb9402a0ae5d87bb68','1','2016-10-19 09:40:11','1','2016-10-19 09:40:30','','0'),('4236bc25e43a42f88f30b9e51c06698b','节目管理','curd','com.cabinetms','program','','节目管理','节目管理','付殿东','3fb33994c5f840bf8e050ed23862c86a','1','2016-06-06 16:10:00','1','2016-06-06 16:44:53','','1'),('5b3b37b242634c98bd704f8a97472e08','节目管理','curd','com.cabinetms','program','','节目管理','节目管理','付殿东','3fb33994c5f840bf8e050ed23862c86a','1','2016-06-06 15:49:34','1','2016-06-06 15:49:34','','1'),('9102742a8648489ca1392ce92a53278f','终端管理','curd','com.cabinetms','terminal','','终端管理','终端管理','houyi','62db7185b7574b62a28d7b07ec024f9d','1','2016-06-07 08:51:00','1','2016-10-11 22:32:34','','0'),('9c9de9db6da743bb899036c6546061ac','单表','curd','com.thinkgem.jeesite.modules','test',NULL,'单表生成','单表','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('a4120543644045ac819bf021ae35ae76','终端机构','curd','com.cabinetms','unit','','终端机构','终端机构','付殿东','c3c293ec079d49c689f38ac82f989593','1','2016-06-07 10:01:07','1','2016-06-07 10:01:07','','1'),('a9feac753b7b4b8e9d32d0a181555d4b','消息策略','curd','com.cabinetms','noticetactic','','消息策略','消息策略','付殿东','55392b3725ac445e9373b9ac2e6f1f2d','1','2016-10-09 13:57:18','1','2016-10-11 10:12:29','','0'),('bafb7bfdc23d4c17b018ffc9ee1b8fea','节目管理','curd','com.cabinetms','program','','节目管理','节目管理','朱广成','203d81a5cc49492aa3d96aa96d04319a','1','2016-10-18 15:00:01','1','2016-10-19 08:53:05','','0'),('e4851edd5e1f4f1e9572870659cfb754','节目策略','curd','com.cabinetms','programtactic','','节目策略','节目策略','付殿东','0af840e0d0954fae94914667654f9bbf','1','2016-06-07 14:43:52','1','2016-06-07 15:27:22','','1'),('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test',NULL,'主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0af840e0d0954fae94914667654f9bbf','cabinetms_program_tactic','节目策略','ProgramTactic','','','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21','','1'),('203d81a5cc49492aa3d96aa96d04319a','cabinetms_program','节目管理','Program','','','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45','','0'),('3e3bc34c17c94921aedbb6fa694410a5','cabinetms_program','节目管理','Program','','','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48','','1'),('3f425f78513e422ca5702f763702e452','cabinetms_program','节目管理','Program','','','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13','','1'),('3fb33994c5f840bf8e050ed23862c86a','cabinetms_program','节目管理','Program','','','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35','','1'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('55392b3725ac445e9373b9ac2e6f1f2d','cabinetms_notice_tactic','消息策略','CabinetmsNoticeTactic','','','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54','','0'),('62a4e76746c54afb9402a0ae5d87bb68','cabinetms_program_tactic','节目策略','CabinetmsProgramTactic','','','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34','','0'),('62db7185b7574b62a28d7b07ec024f9d','cabinetms_terminal','终端信息表','CabinetmsTerminal','','','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04','','0'),('653312ea727a4b7b968dae0050cacec3','cabinetms_notice','消息管理','CabinetmsNotice','','','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('75f995af115e478aa69aefe37b6533d5','cabinetms_program_tactic_detail','节目策略明细表','CabinetmsProgramTacticDetail','cabinetms_program_tactic','program_tactic_id','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08','','0'),('930ddb18b8644d72a6c8310f06e452f3','cabinetms_program_tactic_detail','节目策略详情','ProgramTacticDetail','cabinetms_program_tactic','program_tactic_id','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27','','1'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','业务数据表','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('c3c293ec079d49c689f38ac82f989593','cabinetms_unit','终端机构','CabinetUnit','','','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13','','1'),('eb2ce4341185493eab3976d7a4c2146a','cabinetms_terminal','终端管理','Terminal','','','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50','','1'),('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0282eaee1a5e49c8a4569847c02f53b4','203d81a5cc49492aa3d96aa96d04319a','model_id','模版ID','varchar(64)','String','modelId','0','1','1','1','0','0','=','input','',NULL,'40','1','2016-10-18 14:44:38','1','2016-10-19 08:50:55',NULL,'1'),('032f5b219a76442e97d76a229cd2d284','0af840e0d0954fae94914667654f9bbf','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','1','0','=','input','',NULL,'80','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('03409d309db14c8d8db1e478aea0e272','62db7185b7574b62a28d7b07ec024f9d','office_id','机构ID','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect','',NULL,'50','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('06551988006f49f8923447e76d5e8019','62a4e76746c54afb9402a0ae5d87bb68','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'90','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('069d71439d9d413da9a7f3d5dba8fb31','3fb33994c5f840bf8e050ed23862c86a','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'100','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('06b75a8ff79c461ea8d693737ecab7cc','62a4e76746c54afb9402a0ae5d87bb68','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'80','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('0b2219489f9148d48a9d2d4e1ff612b6','3e3bc34c17c94921aedbb6fa694410a5','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'90','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('0da83ae883ce4f0ab43a76a5dc55a12c','3fb33994c5f840bf8e050ed23862c86a','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'90','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('0ee69603d7c14fa3b5fcbda231c298a7','3f425f78513e422ca5702f763702e452','no','节目编号','varchar(64)','String','no','0','1','1','1','1','0','left_like','input','',NULL,'20','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1085fc468d6e4d16bfccf81da3c79d37','3fb33994c5f840bf8e050ed23862c86a','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('11f0e2aa9b0a4f6db86613a3ee6f8aed','3f425f78513e422ca5702f763702e452','model_id','模版ID','varchar(64)','String','modelId','0','1','1','1','0','0','=','input','',NULL,'40','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('149c924052ad421d9cc0b115c9cfb6b7','0af840e0d0954fae94914667654f9bbf','no','策略编号','varchar(64)','String','no','0','1','1','1','0','0','=','input','',NULL,'20','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('14fb3825bd414c9e9a9700ece78feb0e','c3c293ec079d49c689f38ac82f989593','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'90','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('1516df53daff4bb1b2534788c90d14f6','0af840e0d0954fae94914667654f9bbf','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','0','=','dateselect','',NULL,'90','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('159ff52bea7f4d2fbd01ef904952b374','c3c293ec079d49c689f38ac82f989593','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'100','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('15fc9bae87864e37a4f6c32c221c1052','eb2ce4341185493eab3976d7a4c2146a','id','终端ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('17f44c72d3c543b09b5f4ad8a3caad5a','930ddb18b8644d72a6c8310f06e452f3','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'110','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('18a1bfdab78f4fe79ad1fa189e138a23','75f995af115e478aa69aefe37b6533d5','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'110','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1b2a43a763224c1e9cfafda593929cf8','3fb33994c5f840bf8e050ed23862c86a','status','状态','char(1)','String','status','0','0','1','1','1','1','=','select','program_status',NULL,'50','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1c9340333afe4202afc107ccdf72be15','3f425f78513e422ca5702f763702e452','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'60','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1e3da211f012496c805e966d1bc2fe02','3f425f78513e422ca5702f763702e452','id','节目ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('20b014c298c649fd82ad40144eee12a0','eb2ce4341185493eab3976d7a4c2146a','unit_name','机构名称','varchar(64)','String','unitName','0','1','1','1','0','0','=','input','',NULL,'80','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('213a6fa465194cbda85637533b982261','3fb33994c5f840bf8e050ed23862c86a','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','1','between','dateselect','',NULL,'70','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('23483ed2793546fa841065a033966a4f','55392b3725ac445e9373b9ac2e6f1f2d','status','状态','char(1)','String','status','0','0','1','1','0','1','=','select','',NULL,'60','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('234a59a2dade4c9c9da1550ae1d378f6','203d81a5cc49492aa3d96aa96d04319a','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'90','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('24d21a84a93b4d8683f4256e22b0af38','3f425f78513e422ca5702f763702e452','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('278c3c3450d64d499ac9c66f12207125','3f425f78513e422ca5702f763702e452','status','状态','char(1)','String','status','0','0','1','1','1','1','=','select','program_status',NULL,'50','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('28ad682d54dc491a9c2aae0498a32c2b','eb2ce4341185493eab3976d7a4c2146a','unit_id','机构ID','varchar(64)','String','unitId','0','1','1','1','0','0','=','input','',NULL,'70','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('28b8a24b7e0148ae9f7cbb487eb0498c','c3c293ec079d49c689f38ac82f989593','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('28ba6d3c3bf04f85a22e93a379eb76a4','c3c293ec079d49c689f38ac82f989593','address','机构地址','varchar(128)','String','address','0','1','1','1','0','0','=','input','',NULL,'50','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('2926f5de8109496ca7eb8001067cf311','203d81a5cc49492aa3d96aa96d04319a','model_name','模版名称','varchar(128)','String','modelName','0','1','1','1','1','1','=','select','',NULL,'50','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('2b477d45f77b49e08ca4c71dfc48903f','75f995af115e478aa69aefe37b6533d5','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'100','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('2bef53ab5361445088c2670e38d22c0b','3e3bc34c17c94921aedbb6fa694410a5','id','节目ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('2e657ddacf5049fbacfab5c8e3907b99','62db7185b7574b62a28d7b07ec024f9d','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,'100','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('2f626931bced4075aa6afeaaab7d634c','62db7185b7574b62a28d7b07ec024f9d','terminal_name','终端名称','varchar(20)','String','terminalName','0','1','1','1','1','1','=','input','',NULL,'30','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('318927c603bb412c91dd3b5d9933978f','eb2ce4341185493eab3976d7a4c2146a','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'130','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('33df1e42b22341b38c922f6af9afad13','55392b3725ac445e9373b9ac2e6f1f2d','notice_no','消息编号','varchar(64)','String','noticeNo','0','1','1','1','0','1','=','input','',NULL,'40','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('356fb1a93e37452383505bdfe53775ff','3fb33994c5f840bf8e050ed23862c86a','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'80','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('35fd1807453b42348f959c118a728ccb','55392b3725ac445e9373b9ac2e6f1f2d','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'70','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('384f9b903359400f968150e63969234f','653312ea727a4b7b968dae0050cacec3','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','1','0','=','input','',NULL,'60','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3afb284a37304afe9b08c0511877c6bd','653312ea727a4b7b968dae0050cacec3','id','消息ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('3d33590347ae4b1689b3e7ae75f8d10e','62a4e76746c54afb9402a0ae5d87bb68','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('3d5e9b50052549b78ac7d0bf8919690f','0af840e0d0954fae94914667654f9bbf','endtime','结束时间','datetime','java.util.Date','endtime','0','1','1','1','0','0','=','dateselect','',NULL,'70','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3e267acb025b458eb391fc622e2da93f','0af840e0d0954fae94914667654f9bbf','starttime','开始时间','datetime','java.util.Date','starttime','0','1','1','1','0','0','=','dateselect','',NULL,'60','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('3e707748fa1941c488e4ddc146038318','55392b3725ac445e9373b9ac2e6f1f2d','name','策略名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('3fbb4e8ae51643eebb725839a33b1f84','930ddb18b8644d72a6c8310f06e452f3','program_id','节目ID','varchar(64)','String','programId','0','1','1','0','0','0','=','input','',NULL,'40','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('46b103985dec4dc7931e97eab0641a2d','eb2ce4341185493eab3976d7a4c2146a','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','1','between','dateselect','',NULL,'100','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('46ca15c47b0f42a7a4df1bca030b007b','55392b3725ac445e9373b9ac2e6f1f2d','id','消息策略ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('496dd67345e048a9b8547c7396a7bdfe','62a4e76746c54afb9402a0ae5d87bb68','endtime','结束时间','datetime','String','endtime','0','1','1','1','1','0','=','dateselect','',NULL,'50','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('496e1249d8ca405a908c40cfddeb0ca2','3e3bc34c17c94921aedbb6fa694410a5','status','状态','char(1)','String','status','0','0','1','1','0','1','=','select','program_status',NULL,'60','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('4976bcb392e74446a7334ad8343cc7e8','62a4e76746c54afb9402a0ae5d87bb68','status','策略状态','char(1)','String','status','0','1','1','1','1','1','=','select','programStrategyType',NULL,'120','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4be7a164205c477582d7bbbb442a1895','55392b3725ac445e9373b9ac2e6f1f2d','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('4c1905bb8fe541dd8bb9c00dcdcbb337','62db7185b7574b62a28d7b07ec024f9d','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'130','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4d29f67728f84ebda86219b2b124bca3','eb2ce4341185493eab3976d7a4c2146a','notice_tactic_id','消息策略ID','varchar(64)','String','noticeTacticId','0','1','1','1','0','0','=','input','',NULL,'60','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('4debe21204034593b07d45f9deb6020b','75f995af115e478aa69aefe37b6533d5','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,'90','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('5006f91c72584ff0a37d7a372047ff27','62a4e76746c54afb9402a0ae5d87bb68','name','策略名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('53470dc0fbeb45cf8702273107c474a3','75f995af115e478aa69aefe37b6533d5','program_tactic_id','节目策略ID','varchar(64)','com.cabinetms.programtactic.entity.CabinetmsProgramTactic','programTactic.id','0','1','1','1','0','0','=','input','',NULL,'20','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('547bb02364be417197ee6adf0f74c711','c3c293ec079d49c689f38ac82f989593','name','机构名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('56b361d0016b45df8540e6739bc5b3e0','930ddb18b8644d72a6c8310f06e452f3','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'80','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5791c4574ffe4a6db0512e1ecec5841f','203d81a5cc49492aa3d96aa96d04319a','status','状态','char(1)','String','status','0','0','1','1','1','1','=','select','program_status',NULL,'60','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('57dd7f518f4d4ad484123e0a144726d3','0af840e0d0954fae94914667654f9bbf','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'100','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('589166f71f5647f19b99dbfd442269f3','75f995af115e478aa69aefe37b6533d5','endtime','结束时间','datetime','String','endtime','0','1','1','1','1','0','=','dateselect','',NULL,'70','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('596cc616544c4957bcb6635f8bfac1d1','3fb33994c5f840bf8e050ed23862c86a','id','节目ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5d35dbea9079412689ea498120ba132c','c3c293ec079d49c689f38ac82f989593','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'80','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('624cdbc10e3042539b16928959ef7f3f','203d81a5cc49492aa3d96aa96d04319a','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'120','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('630caf3c313d44f2abe10b0970e44ac7','0af840e0d0954fae94914667654f9bbf','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','between','dateselect','',NULL,'110','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('635d8adb77904de792ff70298a866537','55392b3725ac445e9373b9ac2e6f1f2d','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'90','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('63fb486e83894a088c5e72146af95b4b','0af840e0d0954fae94914667654f9bbf','program_no','节目编号','varchar(64)','String','programNo','0','1','1','1','0','0','=','input','',NULL,'40','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67c56f1a9e994476b468c0a1d2db16a6','75f995af115e478aa69aefe37b6533d5','program_tactic_name','节目策略名称','varchar(64)','String','programTactic.name','0','1','1','1','0','0','=','input','',NULL,'30','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6c1b907675b143a5a582f0b0064d0897','203d81a5cc49492aa3d96aa96d04319a','name','节目名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('6c4d2fdce79b4fd8ada560a813faf531','653312ea727a4b7b968dae0050cacec3','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'100','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('6dd8a64ebffc49379ebe92157c4f3bc9','930ddb18b8644d72a6c8310f06e452f3','starttime','开始时间','datetime','java.util.Date','starttime','0','1','1','1','0','0','=','dateselect','',NULL,'60','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('6e1dd5ae2b9a47c991148060a9885b6a','62db7185b7574b62a28d7b07ec024f9d','notice_id','消息ID','varchar(64)','com.cabinetms.notice.entity.CabinetmsNotice','notice.id|name','0','1','1','1','1','0','=','select','',NULL,'70','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('70b0765351ba48769934c7189a2af82e','eb2ce4341185493eab3976d7a4c2146a','name','终端名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('764ab1614a234ef8b67ec8ac3d1b0ec2','eb2ce4341185493eab3976d7a4c2146a','no','终端编号','varchar(64)','String','no','0','1','1','1','1','1','left_like','input','',NULL,'20','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('76e492b5605b41b1815ecc56d89db777','eb2ce4341185493eab3976d7a4c2146a','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'110','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('78228748f27c47bf8ccb4bd5bec06aac','203d81a5cc49492aa3d96aa96d04319a','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('7c07ba3833ef4b6e85b67032f67d2ad2','eb2ce4341185493eab3976d7a4c2146a','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'120','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('7c713721621c4e93affc2eeacc5b0bf8','75f995af115e478aa69aefe37b6533d5','program_name','节目名称','varchar(64)','String','program.name','0','1','1','1','1','0','=','input','',NULL,'50','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('7ed9b54dec5e4a518129d3ff89d0b065','3e3bc34c17c94921aedbb6fa694410a5','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'70','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7fa1c1623b1f463fb670c91f54a1aa3d','3fb33994c5f840bf8e050ed23862c86a','model_id','模版ID','varchar(64)','String','modelId','0','1','1','1','0','0','=','input','',NULL,'40','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('856b4e3e45564bfea69d697508cca709','3e3bc34c17c94921aedbb6fa694410a5','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('88655e342b304137b152051693773933','62db7185b7574b62a28d7b07ec024f9d','id','终端ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('88a949acb06a4a3f98d1876452b2527d','62db7185b7574b62a28d7b07ec024f9d','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'140','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('8a3908ba924e4dcba9982560703a9624','75f995af115e478aa69aefe37b6533d5','program_id','节目ID','varchar(64)','com.cabinetms.program.entity.Program','program.id','0','1','1','1','0','0','=','input','',NULL,'40','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('900f73a4f31949358bb8285473838711','203d81a5cc49492aa3d96aa96d04319a','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','1','0','=','input','',NULL,'70','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('918e9fc898174fdbba2a0f533a12d0d7','930ddb18b8644d72a6c8310f06e452f3','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'130','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('91fe29111c9a47e4acce6b23725c79e4','eb2ce4341185493eab3976d7a4c2146a','program_tactic_id','节目策略ID','varchar(64)','String','programTacticId','0','1','1','1','0','0','=','input','',NULL,'50','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('924399cc1cd24b588c0d541c81297c89','653312ea727a4b7b968dae0050cacec3','notice_name','消息名称','varchar(64)','String','noticeName','0','1','1','1','1','1','=','input','',NULL,'30','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('925b2f8bb0294133874f94a4c8209c04','55392b3725ac445e9373b9ac2e6f1f2d','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','1','between','dateselect','',NULL,'80','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('934f25ae811244d8a22a5b1c5b0addf0','55392b3725ac445e9373b9ac2e6f1f2d','no','策略编号','varchar(64)','String','no','0','1','1','1','0','1','=','input','',NULL,'20','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('93663d38498d4d65865e5edec9a92481','3f425f78513e422ca5702f763702e452','name','节目名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('953b951a760444229510d146fc71c3b0','c3c293ec079d49c689f38ac82f989593','id','机构ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('9648bde9b976496ca7a432b6c4af7564','3e3bc34c17c94921aedbb6fa694410a5','no','节目编号','varchar(64)','String','no','0','1','1','1','0','0','=','input','',NULL,'20','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9b32e83be766404c9871f719d86f12ba','75f995af115e478aa69aefe37b6533d5','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'120','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('9b59cdae4072479dbc95b3b2c9052bd2','3f425f78513e422ca5702f763702e452','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'80','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('9b84e5ca806b40a0ae1e0229a331c83a','62db7185b7574b62a28d7b07ec024f9d','terminal_ip','终端IP','varchar(64)','String','terminalIp','0','1','1','1','1','1','=','input','',NULL,'40','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('9c4cd09678244fe18b2a6037b2115aa1','62db7185b7574b62a28d7b07ec024f9d','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'90','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('9ca9107ecafa44fa83c6750e4bd60021','3e3bc34c17c94921aedbb6fa694410a5','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'120','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('9cfd2d8b93bc4363981507aeca18acd6','930ddb18b8644d72a6c8310f06e452f3','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('9df4cee256a84ef597be0718b14b896e','653312ea727a4b7b968dae0050cacec3','notice_content','消息内容','varchar(200)','String','noticeContent','0','1','1','1','1','1','like','input','',NULL,'40','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('a259821fdabb4226ae10f93ada888d43','c3c293ec079d49c689f38ac82f989593','no','机构编号','varchar(64)','String','no','0','1','1','1','1','1','like','input','',NULL,'20','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('a50ef33e68764e758a24d4f52333d70b','930ddb18b8644d72a6c8310f06e452f3','program_tactic_name','节目策略名称','varchar(64)','String','programTacticName','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('a563a161cf454e8aa0655cb2ca140ae7','eb2ce4341185493eab3976d7a4c2146a','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'90','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('a7a4dc15abaf4bdb9d4b9eda7f6f8e8d','0af840e0d0954fae94914667654f9bbf','id','节目策略ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('a9a773dbe5bb4c07bc12ec34ad3e388a','3e3bc34c17c94921aedbb6fa694410a5','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,'100','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('ab1224ea8404423f880d95f283cea3ee','55392b3725ac445e9373b9ac2e6f1f2d','notice_name','消息名称','varchar(64)','String','noticeName','0','1','1','1','0','1','=','input','',NULL,'50','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('ac548bb3f9e94bb29e446f1b77f4f630','62db7185b7574b62a28d7b07ec024f9d','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'110','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('ac9c522f07b34c879478c75e7675b365','c3c293ec079d49c689f38ac82f989593','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'60','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('acc96100454d4ff58647daf809ca0443','0af840e0d0954fae94914667654f9bbf','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'120','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('adceba9ef9e54057ac8d626d6ab4c0cf','3f425f78513e422ca5702f763702e452','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','1','between','dateselect','',NULL,'70','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('add75931dc1c495cb3ce63f27c3029bc','930ddb18b8644d72a6c8310f06e452f3','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'100','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('b175910b51b14850a1e4d1d640cc3b83','653312ea727a4b7b968dae0050cacec3','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'90','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('b2d19944250b4a8cbc9313aea5746b7f','eb2ce4341185493eab3976d7a4c2146a','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'140','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('b2da3f769d2a4113b29fdb9dcdaabe28','203d81a5cc49492aa3d96aa96d04319a','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,'100','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('b3695f5137d7454384f67b76dbdac304','653312ea727a4b7b968dae0050cacec3','status','消息状态','char(1)','String','status','0','1','1','1','1','1','=','select','notice_status',NULL,'50','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('b6f9e8b2ca4f4cd9a022e931af239744','3e3bc34c17c94921aedbb6fa694410a5','model_name','模版名称','varchar(128)','String','modelName','0','1','1','1','0','0','=','treeselect','',NULL,'50','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('b72c4f81e249425788825623747b6efd','62db7185b7574b62a28d7b07ec024f9d','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,'120','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('b73a6b27804b497ca5d408196d57a994','62db7185b7574b62a28d7b07ec024f9d','status','终端状态','char(1)','String','status','0','1','1','1','1','1','=','select','terminal_status',NULL,'80','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('b91c128f372842f28d24a2d7e4d3679e','203d81a5cc49492aa3d96aa96d04319a','id','节目ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('bd45de0ca0874242afec11f7c9538b2b','930ddb18b8644d72a6c8310f06e452f3','program_name','节目名称','varchar(64)','String','programName','0','1','1','1','1','0','like','input','',NULL,'50','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('bd5bdcc7407741e4b4b27d58671b58db','3f425f78513e422ca5702f763702e452','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','0','0','=','dateselect','',NULL,'90','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('bdf89abaaa0d4db197ca1b3be300d776','930ddb18b8644d72a6c8310f06e452f3','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'120','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('be71e230834c4365bf7e9265d6ef623d','203d81a5cc49492aa3d96aa96d04319a','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','1','between','dateselect','',NULL,'80','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('c5a775d29b6a4df0893e5723d964af14','62db7185b7574b62a28d7b07ec024f9d','program_tactic_id','节目策略ID','varchar(64)','com.cabinetms.programtactic.entity.CabinetmsProgramTactic','programTactic.id|name','0','1','1','1','1','1','=','select','',NULL,'60','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('c5b6a638d5e64249ba22dee5fe4c0a77','eb2ce4341185493eab3976d7a4c2146a','ip','终端IP','varchar(64)','String','ip','0','1','1','1','1','0','=','input','',NULL,'40','1','2016-06-07 08:49:50','1','2016-06-07 08:49:50',NULL,'1'),('c5ef26aa4b634c2ea3b607e307af0acb','3fb33994c5f840bf8e050ed23862c86a','no','节目编号','varchar(64)','String','no','0','1','1','1','1','1','left_like','input','',NULL,'20','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('c6b1c092fe1c43eaa9abaabcc2e26516','653312ea727a4b7b968dae0050cacec3','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,'70','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('c9bbb4bc530e4fd894ea6a1047e575fc','3fb33994c5f840bf8e050ed23862c86a','name','节目名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('ca5330b92ceb4b8fa4d4988824a48373','62a4e76746c54afb9402a0ae5d87bb68','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cbc4d6c06af446deb5e9e4c470f576f4','3fb33994c5f840bf8e050ed23862c86a','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'60','1','2016-06-06 15:48:19','1','2016-06-06 16:09:35',NULL,'1'),('cbf729747c844a0a816b1d1fbac49f37','0af840e0d0954fae94914667654f9bbf','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'130','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('cc0957d65c094ec397822230bc0898c5','75f995af115e478aa69aefe37b6533d5','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'80','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('ce2ab7453b624aae838ed92bb93fb145','75f995af115e478aa69aefe37b6533d5','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cfef60e9486849eb90a977f7f8ea4cf0','930ddb18b8644d72a6c8310f06e452f3','program_tactic_id','节目策略ID','varchar(64)','String','programTacticId','0','1','1','0','0','0','=','input','',NULL,'20','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('d4f7746593564894afcfa449a1a17416','62db7185b7574b62a28d7b07ec024f9d','terminal_no','终端编号','varchar(20)','String','terminalNo','0','1','0','0','0','0','=','input','',NULL,'20','1','2016-10-11 22:27:29','1','2016-10-11 22:29:04',NULL,'0'),('d5a0bb2d675a4c87814f8314cc0d900d','3e3bc34c17c94921aedbb6fa694410a5','model_id','模版ID','varchar(64)','String','modelId','0','1','1','0','0','0','=','input','',NULL,'40','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d6d72a81e1b8404db68e2c987b8555c3','62a4e76746c54afb9402a0ae5d87bb68','no','策略编号','varchar(64)','String','no','0','1','1','1','0','0','like','input','',NULL,'20','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('d7306985b66e485198bfbf99c7833f67','203d81a5cc49492aa3d96aa96d04319a','no','节目编号','varchar(64)','String','no','0','1','1','1','0','0','=','input','',NULL,'20','1','2016-10-18 14:44:38','1','2016-10-19 08:52:45',NULL,'0'),('d841c31ea4634de69265b9724ed7e75c','62a4e76746c54afb9402a0ae5d87bb68','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,'60','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('d99f9a1a7edb479c8a6f427b226db7cb','62a4e76746c54afb9402a0ae5d87bb68','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','1','between','dateselect','',NULL,'70','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('dea162111acc4b6b8bc3c925e57a03c8','653312ea727a4b7b968dae0050cacec3','notice_no','消息编号','varchar(64)','String','noticeNo','0','1','0','0','0','0','=','input','',NULL,'20','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('deb11bea2cc342f081acf44058104bc2','c3c293ec079d49c689f38ac82f989593','type','机构类型','varchar(64)','String','type','0','1','1','1','1','1','=','select','unit_type',NULL,'40','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('e15b1e1274af425a918d615d44d2acbd','3e3bc34c17c94921aedbb6fa694410a5','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','1','between','dateselect','',NULL,'80','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('e224d2d24acb43cc91409ff1f2fad5f9','75f995af115e478aa69aefe37b6533d5','starttime','开始时间','datetime','String','starttime','0','1','1','1','1','0','=','dateselect','',NULL,'60','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('e2b8248852954215a6f41f9bef9b9489','930ddb18b8644d72a6c8310f06e452f3','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','1','between','dateselect','',NULL,'90','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1'),('e33a922f705c4e6797cd4242438c77d2','0af840e0d0954fae94914667654f9bbf','program_name','节目名称','varchar(64)','String','programName','0','1','1','1','0','0','=','input','',NULL,'50','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('e3820ed34a1248a598b8238dd391e4e5','c3c293ec079d49c689f38ac82f989593','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','1','1','between','dateselect','',NULL,'70','1','2016-06-07 10:00:13','1','2016-06-07 10:00:13',NULL,'1'),('e3b2845882aa49ec80dd6c8025f0f52e','55392b3725ac445e9373b9ac2e6f1f2d','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'120','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('e46410be174948b0840b47d95916e371','0af840e0d0954fae94914667654f9bbf','name','策略名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-07 14:41:59','1','2016-06-07 14:42:21',NULL,'1'),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e9cdc75b0e0649d09dd77488317ee208','3f425f78513e422ca5702f763702e452','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2016-06-06 17:10:13','1','2016-06-06 17:10:13',NULL,'1'),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('eb902025e3914244b3c9fce75ddf0c96','3e3bc34c17c94921aedbb6fa694410a5','name','节目名称','varchar(64)','String','name','0','1','1','1','1','1','like','input','',NULL,'30','1','2016-06-08 15:38:48','1','2016-06-08 15:38:48',NULL,'1'),('edf4b02f66e54a6498f4af95436b6985','75f995af115e478aa69aefe37b6533d5','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'130','1','2016-10-19 09:24:08','1','2016-10-19 09:24:08',NULL,'0'),('f05062e1f3e0427d95229d6ed6f1cbf9','62a4e76746c54afb9402a0ae5d87bb68','starttime','开始时间','datetime','String','starttime','0','1','1','1','1','0','=','dateselect','',NULL,'40','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('f0909e7c941449aaa8fb68f6f11f32cc','653312ea727a4b7b968dae0050cacec3','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,'80','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('f1e17337d672421baf83b77b0f0e3f53','653312ea727a4b7b968dae0050cacec3','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2016-10-11 22:12:16','1','2016-10-11 22:32:07',NULL,'0'),('f2240f1b9d8041bc911e6f33c24354f8','55392b3725ac445e9373b9ac2e6f1f2d','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,'100','1','2016-10-11 10:10:00','1','2016-10-11 10:10:54',NULL,'0'),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('fa7f640ca3a042faa1f7ff5bdf2aa2d8','62a4e76746c54afb9402a0ae5d87bb68','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2016-10-09 13:55:17','1','2016-10-19 09:35:34',NULL,'0'),('fe6b1d470c694165aeafb3e8253dd7fe','930ddb18b8644d72a6c8310f06e452f3','endtime','结束时间','datetime','java.util.Date','endtime','0','1','1','1','0','0','=','dateselect','',NULL,'70','1','2016-06-07 15:35:27','1','2016-06-07 15:35:27',NULL,'1');

/*Table structure for table `gen_template` */

DROP TABLE IF EXISTS `gen_template`;

CREATE TABLE `gen_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

/*Data for the table `gen_template` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请假流程表';

/*Data for the table `oa_leave` */

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

/*Data for the table `oa_notify` */

insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('8e51510759e941aeb8becc6b1b79a454','2','555','5555','','1','1','2016-06-02 09:58:14','1','2016-06-02 09:58:14',NULL,'0');

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

insert  into `oa_notify_record`(`id`,`oa_notify_id`,`user_id`,`read_flag`,`read_date`) values ('303f0f2c4e5747fe8403598eeb983c81','8e51510759e941aeb8becc6b1b79a454','1','1','2016-06-02');

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';

/*Data for the table `oa_test_audit` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','中国','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','吉林省','20','220000','2','1','2013-05-27 08:00:00','1','2016-10-08 11:30:57','','0'),('3','2','0,1,2,','长春市','30','220100','3','1','2013-05-27 08:00:00','1','2016-10-08 11:32:00','','0'),('4','3','0,1,2,3,','市辖区','40','220101','4','1','2013-05-27 08:00:00','1','2016-10-08 11:35:21','','0'),('4429c7983e3c4728b1d853dc97c2420d','ee866e39f5a343ee8ba33b3a0594e211','0,1,ee866e39f5a343ee8ba33b3a0594e211,','沈阳市','30','210100','3','1','2016-10-08 11:34:01','1','2016-10-08 11:34:01','','0'),('5','3','0,1,2,3,','历下区','50','110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','3','0,1,2,3,','高新区','60','110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('d060e866ff3a4fd6a7752e809df48804','4429c7983e3c4728b1d853dc97c2420d','0,1,ee866e39f5a343ee8ba33b3a0594e211,4429c7983e3c4728b1d853dc97c2420d,','和平区','30','210102','4','1','2016-10-08 11:36:16','1','2016-10-08 11:36:16','','0'),('ee866e39f5a343ee8ba33b3a0594e211','1','0,1,','辽宁省','30','210000','2','1','2016-10-08 11:31:36','1','2016-10-08 11:33:34','','0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('03d9c9d392e84c7e8c46f7796a9e01b1','3','大厅','unit_type','终端机构类型','40','0','1','2016-06-07 09:57:05','1','2016-06-07 09:57:28','','0'),('1','0','正常','del_flag','删除标记','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','黄色','color','颜色值','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('100','java.util.Date','Date','gen_java_type','Java类型\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Java类型\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','草稿','oa_notify_status','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','发布','oa_notify_status','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','橙色','color','颜色值','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','未读','oa_notify_read','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','已读','oa_notify_read','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','默认主题','theme','主题方案','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','天蓝主题','theme','主题方案','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13b03f0a6b9e41c7b44d943b5dc15766','3','发布中','notice_status','消息状态发布中','30','0','1','2016-10-11 22:00:05','1','2016-10-11 22:00:25','已经发布，并且没有播放完成的。播放完成后修改为&ldquo;未发布&rdquo;状态。不可编辑，不可删除。','0'),('14','readable','橙色主题','theme','主题方案','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','红色主题','theme','主题方案','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flat主题','theme','主题方案','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','国家','sys_area_type','区域类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','省份、直辖市','sys_area_type','区域类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1873c03d8d744a78879edb787eebfda0','3','策略中','program_status','节目状态','20','0','1','2016-06-06 15:44:49','1','2016-10-24 16:05:16','','0'),('19','3','地市','sys_area_type','区域类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','删除','del_flag','删除标记','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','区县','sys_area_type','区域类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','1','公司','sys_office_type','机构类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','部门','sys_office_type','机构类型','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','3','小组','sys_office_type','机构类型','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23cf389460bf4c7a85e054749eb5edaf','2','播放中','terminal_status','终端播放中','20','0','1','2016-10-11 22:20:07','1','2016-10-11 22:20:07','节目在播放中','0'),('24','4','其它','sys_office_type','机构类型','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','综合部','sys_office_common','快捷通用部门','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','开发部','sys_office_common','快捷通用部门','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','人力部','sys_office_common','快捷通用部门','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','一级','sys_office_grade','机构等级','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','二级','sys_office_grade','机构等级','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2b834b11b2ae4c10b7c5698215801ba6','3','已发布','programStrategyType','节目策略类型','30','0','1','2016-10-18 15:33:04','1','2016-10-21 16:43:11','','0'),('2e6a5d7f21474445b9411c1fd930cb1f','1','空闲中','terminal_status','终端空闲中','10','0','1','2016-10-11 22:19:40','1','2016-10-11 22:19:40','没有节目在播放','0'),('3','1','显示','show_hide','显示/隐藏','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','三级','sys_office_grade','机构等级','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','四级','sys_office_grade','机构等级','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','所有数据','sys_data_scope','数据范围','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','所在公司及以下数据','sys_data_scope','数据范围','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','所在公司数据','sys_data_scope','数据范围','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','所在部门及以下数据','sys_data_scope','数据范围','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','5','所在部门数据','sys_data_scope','数据范围','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','仅本人数据','sys_data_scope','数据范围','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37745e4ee06c4176a03bb41e83a4bb87','4','关闭中','terminal_status','终端关闭中','40','0','1','2016-10-11 22:20:45','1','2016-11-23 10:06:16','服务器和终端不能建立连接','0'),('38','9','按明细设置','sys_data_scope','数据范围','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','系统管理','sys_user_type','用户类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3d5e14ebe5974c32aae30722bc49a7f8','image','图片模板','template_type','模板类型','30','0','1','2016-10-19 10:36:22','1','2016-10-19 10:36:22','','0'),('4','0','隐藏','show_hide','显示/隐藏','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','部门经理','sys_user_type','用户类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','普通用户','sys_user_type','用户类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','基础主题','cms_theme','站点主题','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','蓝色主题','cms_theme','站点主题','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','red','红色主题','cms_theme','站点主题','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44847c5cc81042e59d14e5be869342ec','0','未知','unit_type','终端机构类型','10','0','1','2016-06-07 09:55:56','1','2016-06-07 09:57:37','终端摆放位置','0'),('45','article','文章模型','cms_module','栏目模型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','图片模型','cms_module','栏目模型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('46801c2950e64a1c853c2a37d7f8f4b8','3','策略中','terminal_status','终端策略中','30','0','1','2016-11-23 10:07:11','1','2016-11-23 10:07:32','','0'),('47','download','下载模型','cms_module','栏目模型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','链接模型','cms_module','栏目模型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','专题模型','cms_module','栏目模型','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','是','yes_no','是/否','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','默认展现方式','cms_show_modes','展现方式','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('502a2540ac7c4ac4b11ffa02c662031c','1','待提交','programStrategyType','节目策略类型','10','0','1','2016-10-18 15:32:28','1','2016-10-21 16:43:03','','0'),('51','1','首栏目内容列表','cms_show_modes','展现方式','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','栏目第一条内容','cms_show_modes','展现方式','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','发布','cms_del_flag','内容状态','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','删除','cms_del_flag','内容状态','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','审核','cms_del_flag','内容状态','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','首页焦点图','cms_posid','推荐位','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','栏目页文章推荐','cms_posid','推荐位','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','咨询','cms_guestbook','留言板分类','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','建议','cms_guestbook','留言板分类','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','否','yes_no','是/否','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','投诉','cms_guestbook','留言板分类','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','其它','cms_guestbook','留言板分类','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','公休','oa_leave_type','请假类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','病假','oa_leave_type','请假类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','事假','oa_leave_type','请假类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','调休','oa_leave_type','请假类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','婚假','oa_leave_type','请假类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','接入日志','sys_log_type','日志类型','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('67f3d9c4ab8c4dc3b7b77ef20359224b','2','视频类型','model_type','模版类型','30','0','1','2016-06-06 15:41:34','1','2016-06-06 15:41:34','','0'),('68','2','异常日志','sys_log_type','日志类型','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('6851b10f797e43c2bcd27eb0b6c46929','3','混合类型','model_type','模版类型','40','0','1','2016-06-06 15:41:53','1','2016-06-06 15:41:53','','0'),('689b86ab2d5c4864b4a4dcb359f3fc0e','2','未发布','programStrategyType','节目策略类型','20','0','1','2016-10-18 15:32:44','1','2016-10-21 16:43:08','','0'),('69','leave','请假流程','act_type','流程类型','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','红色','color','颜色值','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','审批测试流程','act_type','流程类型','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','分类1','act_category','流程分类','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('72','2','分类2','act_category','流程分类','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('73','crud','增删改查','gen_category','代码生成分类','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','树结构','gen_category','代码生成分类','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','查询方式','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','查询方式','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','查询方式','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','查询方式','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','绿色','color','颜色值','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','查询方式','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('80ca28c81d3e46b7b0c962ad5a74984a','3000','图片轮播时间','image_idle','轮播时间','10','0','1','2016-10-28 11:37:01','1','2016-10-28 11:46:44','','0'),('81','like','Like','gen_query_type','查询方式','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','查询方式','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','查询方式','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','文本框','gen_show_type','字段生成方案','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','文本域','gen_show_type','字段生成方案','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','下拉框','gen_show_type','字段生成方案','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','复选框','gen_show_type','字段生成方案','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','单选框','gen_show_type','字段生成方案','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','日期选择','gen_show_type','字段生成方案','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89439b230b774450ade3bad162ba2130','2','走廊','unit_type','终端机构类型','30','0','1','2016-06-07 09:56:39','1','2016-06-07 09:56:39','','0'),('9','blue','蓝色','color','颜色值','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','人员选择\0','gen_show_type','字段生成方案','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','部门选择','gen_show_type','字段生成方案','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','区域选择','gen_show_type','字段生成方案','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Java类型','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Java类型','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','男','sex','性别','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','女','sex','性别','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Java类型\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Java类型\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9b7f095868044de9b70931925012a868','2','已提交','program_status','节目状态','20','0','1','2016-06-06 15:44:35','1','2016-10-24 16:04:45','','0'),('9c72d8bded5642fc9e2841927e5db4d4','mix','混合模板','template_type','模板类型','40','0','1','2016-10-19 10:36:32','1','2016-10-19 10:36:32','','0'),('a7b8e6881ef1440f9568376385de2c69','2','未发布','notice_status','消息状态未发布','20','0','1','2016-10-11 21:59:11','1','2016-10-11 22:00:15','填写完成的，进行了提交的，此状态可以进行发布，不可编辑，可删除','0'),('aece75b7f9f7491bb1ee18e41a8953c2','1','图片类型','model_type','模版类型','20','0','1','2016-06-06 15:41:12','1','2016-06-06 15:41:12','','0'),('b34c0221d023416195ac3382e15c618d','0','文本类型','model_type','模版类型','10','0','1','2016-06-06 15:40:46','1','2016-06-06 15:40:46','','0'),('b63b4fe7eaa94bcf8d1263b0e70659b4','txt','文本类型','template_type','模板类型','10','0','1','2016-10-19 10:34:56','1','2016-10-19 10:35:42','','0'),('d5fad8fa51904a9e8ff2d0e677a7bae4','video','视频模板','template_type','模板类型','20','0','1','2016-10-19 10:36:02','1','2016-10-19 10:36:02','','0'),('ecbb478bbd5a4c80af1468a471da9a25','1','电梯','unit_type','终端机构类型','20','0','1','2016-06-07 09:56:19','1','2016-06-07 09:56:19','','0'),('f2a807dad1414aaa9dad2968af3f7588','1','待提交','program_status','节目状态','10','0','1','2016-10-18 14:54:13','1','2016-10-24 16:03:44','','0'),('fcdc6965179241eca090bdcfcdd01740','1','待提交','notice_status','消息状态待提交','10','0','1','2016-10-11 21:58:35','1','2016-10-11 21:58:35','新增完成了，没有进行提交的，此状态不能发布，可编辑，可删除','0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

/*Data for the table `sys_log` */


/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('00a7f20428a54a5db62295ecab9f92a4','c96ca6d5d412493aa696d85406a5cad5','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,c96ca6d5d412493aa696d85406a5cad5,','修改','60','','','','0','sys:dict:edit','1','2016-06-02 15:46:44','1','2016-06-02 15:46:44','','0'),('02a7582d50f347e78002739cfce1a027','e45c125b042d40a193f581f4cdbe5495','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,e45c125b042d40a193f581f4cdbe5495,','编辑','60','','','','0','programtactic:cabinetmsProgramTactic:edit','1','2016-10-18 15:26:47','1','2016-10-18 15:26:47','','0'),('04760cc372044016bfcaa1c363495f8b','4d1d5051b56e4bcbb0daf603a6d3473d','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,','终端节目管理','60','','','','1','','1','2016-06-02 15:24:04','1','2016-06-02 15:24:04','','1'),('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑','60','','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','树结构','90','/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('1','0','0,','功能菜单','0',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理','60','/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','查看','30',NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','修改','40',NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','机构用户','970',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','区域管理','50','/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','查看','30',NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','修改','40',NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','机构管理','40','/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17254e99a45f49a097abd2cf041825b8','41bce4d151dd48049a73e440d2a50505','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,41bce4d151dd48049a73e440d2a50505,','修改','60','','','','0','sys:office:edit','1','2016-06-02 15:50:38','1','2016-06-02 15:50:38','','0'),('18','17','0,1,2,13,17,','查看','30',NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','修改','40',NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1fcad9026fa9415f814f62f962023f85','4d1d5051b56e4bcbb0daf603a6d3473d','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,','终端信息管理','30','/terminal/cabinetmsTerminal','','laptop','1','','1','2016-06-02 15:23:51','1','2016-10-12 20:49:26','','0'),('2','1','0,1,','系统设置','900','','','','0','','1','2013-05-27 08:00:00','1','2016-10-08 14:20:47','','0'),('20','13','0,1,2,13,','用户管理','30','/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20dbc39ef95e49e8a647cfe82f4daa95','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','区域管理','210','/sys/area/','','','1','','1','2016-10-08 11:21:25','1','2016-10-08 11:21:25','','0'),('21','20','0,1,2,13,20,','查看','30',NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','修改','40',NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('227b128a47fe422e806e453aac974d53','c45ed914b6924ed48b1666f243760cae','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,c45ed914b6924ed48b1666f243760cae,','机构添加','60','/unit/cabinetUnit/form','','','1','unit:cabinetUnit:edit','1','2016-06-07 10:03:19','1','2016-06-07 10:03:19','','0'),('23','2','0,1,2,','关于帮助','990',NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','23','0,1,2,23','官方首页','30','http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','项目支持','50','http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','论坛交流','80','http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26dcc4bd31aa4e4bbaffee152373c34d','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','个人信息','150','','','','1','','1','2016-10-08 14:17:24','1','2016-10-08 14:17:24','','0'),('27','1','0,1,','我的面板','100','','','','0','','1','2013-05-27 08:00:00','1','2016-10-08 14:20:14','','0'),('28','27','0,1,27,','个人信息','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','个人信息','30','/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2b893f7dae23467981802cdc49dc9088','2fe057ef51784d73951979f70e5afecc','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,','节目删除','90','','','','1','','1','2016-06-02 15:23:06','1','2016-06-02 15:23:06','','1'),('2df2cd5ca9f9406ab3560a5386af0ea2','c96ca6d5d412493aa696d85406a5cad5','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,c96ca6d5d412493aa696d85406a5cad5,','查看','30','','','','0','sys:dict:view','1','2016-06-02 15:46:28','1','2016-06-02 15:46:28','','0'),('2fe057ef51784d73951979f70e5afecc','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','节目管理','30','','','','1','','1','2016-06-02 15:19:07','1','2016-06-02 15:19:07','','0'),('3','2','0,1,2,','系统设置','980',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','修改密码','40','/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','内容管理','500','','','','0','','1','2013-05-27 08:00:00','1','2016-10-08 14:20:26','','0'),('32','31','0,1,31,','栏目设置','990',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','栏目管理','30','/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','查看','30',NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','修改','40',NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','站点设置','40','/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('360d2d2aed524a69aedf8af24ed38f80','26dcc4bd31aa4e4bbaffee152373c34d','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,26dcc4bd31aa4e4bbaffee152373c34d,','修改密码','60','/sys/user/modifyPwd','','','1','','1','2016-10-08 14:18:34','1','2016-10-08 14:18:34','','0'),('37','36','0,1,31,32,36,','查看','30',NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3732a34c00af43388240ffe4ad8489a3','41bce4d151dd48049a73e440d2a50505','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,41bce4d151dd48049a73e440d2a50505,','查看','30','','','','0','sys:office:view','1','2016-06-02 15:50:21','1','2016-06-02 15:50:21','','0'),('38','36','0,1,31,32,36,','修改','40',NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','切换站点','50','/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例','120','','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('3e320999938d44eaaea9c5542e3fa3f6','2fe057ef51784d73951979f70e5afecc','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,','节目管理','30','/program/program/list','','','1','','1','2016-06-02 15:22:34','1','2016-11-23 11:15:44','','0'),('4','3','0,1,2,3,','菜单管理','30','/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','内容管理','500',NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','内容发布','30','/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41bce4d151dd48049a73e440d2a50505','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','机构管理','150','/sys/office/','','','1','','1','2016-06-02 15:49:42','1','2016-06-02 15:49:59','','0'),('42','41','0,1,31,40,41,','文章模型','40','/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4220fb7eec8d45b5ba34d4b8c9472cd8','2fe057ef51784d73951979f70e5afecc','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,','节目发布','120','','','','1','','1','2016-06-02 15:23:17','1','2016-06-02 15:23:17','','1'),('43','42','0,1,31,40,41,42,','查看','30',NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','修改','40',NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','审核','50',NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','链接模型','60','/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','查看','30',NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','修改','40',NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看','30','','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('49','46','0,1,31,40,41,46,','审核','50',NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('497bf29eb3504019b0a6050c9aa2702d','a5e0169b98c64494b22ff41fae36828e','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,a5e0169b98c64494b22ff41fae36828e,','插播消息查询','90','','','','1','','1','2016-06-02 15:27:40','1','2016-06-02 15:27:40','','1'),('4bb3f18225ab4de7baa54aae8af6651e','04760cc372044016bfcaa1c363495f8b','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,04760cc372044016bfcaa1c363495f8b,','播放控制','60','','','','1','','1','2016-06-02 15:26:26','1','2016-06-02 15:26:26','','1'),('4d1d5051b56e4bcbb0daf603a6d3473d','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','终端管理','60','','','','1','','1','2016-06-02 15:19:19','1','2016-06-02 15:19:19','','0'),('4e1dd804ed2444dd98919f2eac47d112','675b1822b304489bb7571dd6c9aa8183','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,','消息策略','60','','','','1','','1','2016-06-07 10:36:27','1','2016-06-07 10:36:27','','1'),('4f1a0b9b0fbd48b488c576f4a480b022','58d0b78c555c4164ad858c50215e398a','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,58d0b78c555c4164ad858c50215e398a,','查看','30','','','','0','sys:menu:view','1','2016-06-02 15:40:00','1','2016-06-02 15:40:00','','0'),('4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','1','0,1,','服务菜单','5030','','','','1','','1','2016-06-02 15:17:55','1','2016-06-02 15:17:55','','0'),('5','4','0,1,2,3,4,','查看','30',NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','评论管理','40','/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','查看','30',NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51f75adfe8b642518b5ff8b839664b34','9fcc920202e7441ba7c8134d02ac0eb0','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,9fcc920202e7441ba7c8134d02ac0eb0,','日志查询','30','/sys/log','','','1','sys:log:view','1','2016-06-02 15:38:45','1','2016-06-02 15:47:14','','0'),('52','50','0,1,31,40,50,','审核','40',NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','公共留言','80','/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','查看','30',NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','审核','40',NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','71','0,1,27,71,','文件管理','90','/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','查看','30',NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','上传','40',NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58d0b78c555c4164ad858c50215e398a','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','菜单管理','30','/sys/menu/','','','1','','1','2016-06-02 15:37:03','1','2016-06-02 15:39:20','','0'),('59','56','0,1,27,40,56,','修改','50',NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5a41b8999b8343239a47d6e8288f90b1','1fcad9026fa9415f814f62f962023f85','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,1fcad9026fa9415f814f62f962023f85,','查看','30','','','','0','terminal:cabinetmsTerminal:view','1','2016-06-02 15:25:33','1','2016-10-12 20:50:56','','0'),('6','4','0,1,2,3,4,','修改','40',NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','统计分析','600',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','信息量统计','30','/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','在线办公','200','','','','0','','1','2013-05-27 08:00:00','1','2016-10-08 14:20:06','','0'),('63','62','0,1,62,','个人办公','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('631a87ca081e4956aeee765f09c21094','20dbc39ef95e49e8a647cfe82f4daa95','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,20dbc39ef95e49e8a647cfe82f4daa95,','查看','30','sys:area:view','','','0','','1','2016-10-08 11:22:24','1','2016-10-08 11:25:31','','0'),('64','63','0,1,62,63,','请假办理','300','/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','查看','30',NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','修改','40',NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','日志查询','985',NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('675b1822b304489bb7571dd6c9aa8183','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','策略管理','70','','','','1','','1','2016-06-07 10:35:13','1','2016-06-07 10:35:13','','0'),('68','67','0,1,2,67,','日志查询','30','/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','流程管理','300',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('695d665d19a34a45928491eef463c177','4e1dd804ed2444dd98919f2eac47d112','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,4e1dd804ed2444dd98919f2eac47d112,','消息策略新增','30','/noticetactic/cabinetmsNoticeTactic/form','','','1','noticetactic:cabinetmsNoticeTactic:edit','1','2016-06-07 10:43:29','1','2016-10-11 10:32:47','','1'),('6b7bce15847b4e72af5dbbe9a1a9e6d3','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','节目管理1','40','','','adjust','1','','1','2016-10-18 11:57:17','1','2016-10-18 12:00:10','','1'),('6cd6e0d1dc27442f8289ff2ca2665b2e','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','消息管理','20','','','','1','','1','2016-10-12 21:13:38','1','2016-10-12 21:13:38','','0'),('7','3','0,1,2,3,','角色管理','50','/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','流程管理','50','/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7086efa770b3497d967364cafe9c148f','dc9069f7ddf4449981bb760f9a9b0f86','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,dc9069f7ddf4449981bb760f9a9b0f86,','修改','60','','','','0','sys:user:edit','1','2016-06-02 15:41:48','1','2016-06-02 15:47:39','','0'),('71','27','0,1,27,','文件管理','90',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','模型管理','100','/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('73','63','0,1,62,63,','我的任务','50','/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','审批测试','100','/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('75','1','0,1,','在线演示','3000',NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('75b11b06d8d740bc87d1ff0c63151f12','e45c125b042d40a193f581f4cdbe5495','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,e45c125b042d40a193f581f4cdbe5495,','查询','30','','','','0','programtactic:cabinetmsProgramTactic:view','1','2016-10-18 15:26:23','1','2016-10-18 15:26:23','','0'),('79','1','0,1,','代码生成','5000','','','','0','','1','2013-10-16 08:00:00','1','2016-10-08 14:21:18','','0'),('8','7','0,1,2,3,7,','查看','30',NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','代码生成','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','生成方案配置','30','/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('815a2d6efe424325bbe843ca9efb4d0d','2fe057ef51784d73951979f70e5afecc','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,','节目策略','90','','','','1','','1','2016-06-07 10:33:28','1','2016-06-07 10:33:28','','1'),('82','80','0,1,79,80,','业务表配置','20','/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','代码模板管理','90','/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('84','67','0,1,2,67,','连接池监视','40','/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','行政区域','80','/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','组件演示','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('87','86','0,1,75,86,','组件演示','30','/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','通知通告','20','','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','我的通告','30','/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('8e30fa7f3ace4180826da9fa6ac4b694','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','代码生成','180','','','','1','','1','2016-06-02 15:50:58','1','2016-06-02 15:50:58','','0'),('9','7','0,1,2,3,7,','修改','40',NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','通告管理','50','/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('9c2989e7c81d4c31a71074c608f99cd1','26dcc4bd31aa4e4bbaffee152373c34d','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,26dcc4bd31aa4e4bbaffee152373c34d,','个人信息','30','/sys/user/info','','','1','','1','2016-10-08 14:18:12','1','2016-10-08 14:18:12','','0'),('9d458d0bc2c843ddaf16d63da0dbc689','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','角色管理','90','/sys/role/','','','1','','1','2016-06-02 15:37:29','1','2016-06-02 15:43:17','','0'),('9fcc920202e7441ba7c8134d02ac0eb0','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','日志管理','120','','','','1','','1','2016-06-02 15:20:00','1','2016-06-02 15:20:00','','0'),('a032b46de763467d9e5087866a4f5626','04760cc372044016bfcaa1c363495f8b','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,04760cc372044016bfcaa1c363495f8b,','节目推送','30','','','','1','','1','2016-06-02 15:26:10','1','2016-06-02 15:26:10','','1'),('a5e0169b98c64494b22ff41fae36828e','4d1d5051b56e4bcbb0daf603a6d3473d','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,','消息插播管理','90','','','','1','','1','2016-06-02 15:24:18','1','2016-06-02 15:24:18','','1'),('a7b33e2abc9a49d69d206f29d73d1d6f','20dbc39ef95e49e8a647cfe82f4daa95','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,20dbc39ef95e49e8a647cfe82f4daa95,','修改','60','sys:area:edit','','','0','','1','2016-10-08 11:22:52','1','2016-10-08 11:25:57','','0'),('a86dc0f1811744638519a2c8f754ce5c','1fcad9026fa9415f814f62f962023f85','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,1fcad9026fa9415f814f62f962023f85,','修改','60','','','','0','terminal:cabinetmsTerminal:edit','1','2016-06-02 15:25:48','1','2016-10-12 20:52:39','','0'),('a8b2d57fbc11499da1a2a19e87afe2a7','675b1822b304489bb7571dd6c9aa8183','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,','节目策略','30','','','','1','','1','2016-06-07 10:36:11','1','2016-06-07 10:36:11','','1'),('a992c9fe83f145fbbaa704ce14a4ef01','dc9069f7ddf4449981bb760f9a9b0f86','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,dc9069f7ddf4449981bb760f9a9b0f86,','查看','30','','','','0','sys:user:view','1','2016-06-02 15:41:28','1','2016-06-02 15:41:28','','0'),('ac3ff08440784058b37a6b79826d9fae','2fe057ef51784d73951979f70e5afecc','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,','节目查询','60','/program/cabinetmsProgram/list','','','1','program:cabinetmsProgram:view','1','2016-06-02 15:22:48','1','2016-10-08 15:27:47','','1'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑','60','','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b0e3fbc3e69f4264b96ecae790dcb748','a5e0169b98c64494b22ff41fae36828e','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,a5e0169b98c64494b22ff41fae36828e,','插播消息控制','60','','','','1','','1','2016-06-02 15:27:19','1','2016-06-02 15:27:19','','1'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','主子表','60','/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b3783d9b71cb46ee925849f3f263e630','a8b2d57fbc11499da1a2a19e87afe2a7','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,a8b2d57fbc11499da1a2a19e87afe2a7,','节目策略新增','30','/programtactic/cabinetmsProgramTactic/form','','','1','programtactic:cabinetmsProgramTactic:edit','1','2016-06-07 10:42:22','1','2016-10-11 10:26:00','','1'),('b3ef86d0978a4ed39244e3b0304fbbb7','f411431eb6144026bdb4d865bca65520','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,6cd6e0d1dc27442f8289ff2ca2665b2e,f411431eb6144026bdb4d865bca65520,','修改','60','','','','0','notice:cabinetmsNotice:edit','1','2016-10-12 21:19:56','1','2016-10-12 21:19:56','','0'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','单表','30','/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看','30','','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('c3430167275d4549ad6ed277e1105dd2','3e320999938d44eaaea9c5542e3fa3f6','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,3e320999938d44eaaea9c5542e3fa3f6,','编辑','60','','','','0','program:program:edit','1','2016-10-18 15:07:18','1','2016-10-18 15:07:18','','0'),('c433fe2b1cee4dc7a09a3c53b9778c0f','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,','系统管理','90','','','','1','','1','2016-06-02 15:19:51','1','2016-06-02 15:19:51','','0'),('c45ed914b6924ed48b1666f243760cae','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','终端机构','20','','','','0','','1','2016-06-07 09:45:22','1','2016-10-08 14:22:11','','0'),('c54ba9edc75844c3a62e7d03b4ef240c','9d458d0bc2c843ddaf16d63da0dbc689','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,9d458d0bc2c843ddaf16d63da0dbc689,','查看','30','','','','0','sys:role:view','1','2016-06-02 15:43:35','1','2016-06-02 15:47:24','','0'),('c96ca6d5d412493aa696d85406a5cad5','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','字典管理','120','/sys/dict/','','','1','','1','2016-06-02 15:37:38','1','2016-06-02 15:46:06','','0'),('cd924730f8fb49519d0de987f3d3c184','8e30fa7f3ace4180826da9fa6ac4b694','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,8e30fa7f3ace4180826da9fa6ac4b694,','业务表配置','30','/gen/genTable','','','1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2016-06-02 15:51:22','1','2016-06-02 15:52:03','','0'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑','60','','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('d366e67d0b2c48f9a4591e857b26dd41','9d458d0bc2c843ddaf16d63da0dbc689','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,9d458d0bc2c843ddaf16d63da0dbc689,','修改','60','','','','0','sys:role:edit','1','2016-06-02 15:43:53','1','2016-06-02 15:47:31','','0'),('d8bececa356d49b0b7e20f932fa0c625','2fe057ef51784d73951979f70e5afecc','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,','节目编辑','150','','','','1','','1','2016-06-02 15:23:30','1','2016-06-02 15:23:30','','1'),('dc9069f7ddf4449981bb760f9a9b0f86','c433fe2b1cee4dc7a09a3c53b9778c0f','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,','用户管理','60','/sys/user/index','','','1','','1','2016-06-02 15:37:18','1','2016-06-02 15:40:59','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看','30','','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('dffa585a19c44b619bc9ba52e83cd532','8e30fa7f3ace4180826da9fa6ac4b694','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,8e30fa7f3ace4180826da9fa6ac4b694,','生成方案配置','60','/gen/genScheme','','','1','gen:genScheme:view,gen:genScheme:edit','1','2016-06-02 15:52:19','1','2016-06-02 15:52:58','','0'),('e031ccc2441045d79f3a1828c46b2989','58d0b78c555c4164ad858c50215e398a','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,58d0b78c555c4164ad858c50215e398a,','修改','60','','','','0','sys:menu:edit','1','2016-06-02 15:40:35','1','2016-06-02 15:47:53','','0'),('e335c2446dad49038c503ed435e546cc','f411431eb6144026bdb4d865bca65520','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,6cd6e0d1dc27442f8289ff2ca2665b2e,f411431eb6144026bdb4d865bca65520,','查看','30','','','','0','notice:cabinetmsNotice:view','1','2016-10-12 21:18:17','1','2016-10-12 21:18:32','','0'),('e39290ba48604010ac67a83f11f1caa6','c45ed914b6924ed48b1666f243760cae','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,c433fe2b1cee4dc7a09a3c53b9778c0f,c45ed914b6924ed48b1666f243760cae,','机构查询','30','/unit/cabinetUnit/list','','','1','unit:cabinetUnit:view','1','2016-06-07 10:02:44','1','2016-06-07 10:02:44','','0'),('e42b390a6ba54ebd9ce79c7aa6a544dd','4e1dd804ed2444dd98919f2eac47d112','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,4e1dd804ed2444dd98919f2eac47d112,','消息策略查询','60','/noticetactic/cabinetmsNoticeTactic/list','','','1','noticetactic:cabinetmsNoticeTactic:view','1','2016-06-07 10:43:42','1','2016-10-11 10:33:13','','1'),('e45c125b042d40a193f581f4cdbe5495','675b1822b304489bb7571dd6c9aa8183','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,','节目策略管理','30','/programtactic/cabinetmsProgramTactic/list','','','1','','1','2016-10-18 15:26:05','1','2016-10-18 15:26:05','','0'),('eb98d24431b34608b0534e1d640beea2','a8b2d57fbc11499da1a2a19e87afe2a7','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,675b1822b304489bb7571dd6c9aa8183,a8b2d57fbc11499da1a2a19e87afe2a7,','节目策略查询','60','/programtactic/cabinetmsProgramTactic/list','','','1','programtactic:cabinetmsProgramTactic:view','1','2016-06-07 10:42:40','1','2016-10-09 14:08:51','','1'),('f411431eb6144026bdb4d865bca65520','6cd6e0d1dc27442f8289ff2ca2665b2e','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,6cd6e0d1dc27442f8289ff2ca2665b2e,','消息信息管理','30','/notice/cabinetmsNotice','','comment','1','','1','2016-10-12 21:17:40','1','2016-10-12 21:17:40','','0'),('f42c8269b49f4fa18984035c490a363f','3e320999938d44eaaea9c5542e3fa3f6','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,2fe057ef51784d73951979f70e5afecc,3e320999938d44eaaea9c5542e3fa3f6,','查看','30','','','','0','program:program:view','1','2016-10-18 15:06:59','1','2016-10-18 15:06:59','','0'),('fa7e5d84de10402891dae5c0afcb0a08','a5e0169b98c64494b22ff41fae36828e','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,4d1d5051b56e4bcbb0daf603a6d3473d,a5e0169b98c64494b22ff41fae36828e,','插播消息增加','30','','','','1','','1','2016-06-02 15:27:02','1','2016-06-02 15:27:02','','1'),('fbcd389dfa51461aa72d1eb94416eccf','6b7bce15847b4e72af5dbbe9a1a9e6d3','0,1,4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1,6b7bce15847b4e72af5dbbe9a1a9e6d3,','节目管理','30','','','asterisk','1','','1','2016-10-18 12:01:06','1','2016-10-18 12:01:06','','1');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0acd4c2f5fe142258edd4ab5ffe6ad5b','fb2703e6dd1c493591a19f8dd7170027','0,1,fb2703e6dd1c493591a19f8dd7170027,','吉林省展览馆管理员','30','2','100000003001','2','3','','','','','','','1','','','1','2016-10-08 11:49:39','1','2016-10-08 13:38:20','','0'),('1','0','0,','中国','10','1','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-10-08 11:41:40','','0'),('10','7','0,1,7,','市场部','30','3','200003','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('11','7','0,1,7,','技术部','40','3','200004','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('12','7','0,1,7,','沈阳市展览馆','0','4429c7983e3c4728b1d853dc97c2420d','201000','1','3','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-10-08 11:47:31','','0'),('13','12','0,1,7,12,','公司领导','10','4','201001','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('14','12','0,1,7,12,','综合部','20','4','201002','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('15','12','0,1,7,12,','市场部','30','4','201003','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('16','12','0,1,7,12,','技术部','40','4','201004','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('17','7','0,1,7,','历下区分公司','40','5','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('18','17','0,1,7,17,','公司领导','10','5','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('19','17','0,1,7,17,','综合部','20','5','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','1','0,1,','系统管理','10','1','100001','2','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-10-08 11:43:13','','0'),('20','17','0,1,7,17,','市场部','30','5','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('21','17','0,1,7,17,','技术部','40','5','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('22','7','0,1,7,','高新区分公司','50','6','201010','1','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('23','22','0,1,7,22,','公司领导','10','6','201011','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('24','22','0,1,7,22,','综合部','20','6','201012','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('25','22','0,1,7,22,','市场部','30','6','201013','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','22','0,1,7,22,','技术部','40','6','201014','2','3',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('287c1470feb14b60890f9cd571ff33b8','12','0,1,7,12,','展厅二','30','4429c7983e3c4728b1d853dc97c2420d','201000003','1','3','','','','','','','1','','','1','2016-10-08 14:04:42','1','2016-10-08 14:04:42','','0'),('3','1','0,1,','综合部','20','2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','1','0,1,','市场部','30','2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('412371e480224ebab130c5cd1377bb59','86b3334b98c742909e09c86f40404070','0,1,fb2703e6dd1c493591a19f8dd7170027,86b3334b98c742909e09c86f40404070,','展厅一','30','3','100000003002002','1','3','','','','','','','1','','','1','2016-10-08 13:39:07','1','2016-10-08 13:39:07','','0'),('4e9ef144a37b410097df2100ec0187d5','86b3334b98c742909e09c86f40404070','0,1,fb2703e6dd1c493591a19f8dd7170027,86b3334b98c742909e09c86f40404070,','展厅三','30','3','100000003002004','1','3','','','','','','','1','','','1','2016-10-08 13:45:24','1','2016-10-08 13:45:24','','0'),('5','1','0,1,','技术部','40','2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','1','0,1,','研发部','50','2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6880edbcb0df44829cbb77b92d1de23c','12','0,1,7,12,','展厅三','30','4429c7983e3c4728b1d853dc97c2420d','201000004','1','3','','','','','','','1','','','1','2016-10-08 14:05:10','1','2016-10-08 14:05:10','','0'),('7','1','0,1,','辽宁省展览馆','20','ee866e39f5a343ee8ba33b3a0594e211','200000','1','2','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-10-08 11:44:37','','0'),('7a011661fb5c47d6b48ac9553add589b','86b3334b98c742909e09c86f40404070','0,1,fb2703e6dd1c493591a19f8dd7170027,86b3334b98c742909e09c86f40404070,','展厅二','30','3','100000003002003','1','3','','','','','','','1','','','1','2016-10-08 13:39:47','1','2016-10-08 13:39:47','','0'),('8','7','0,1,7,','辽宁省展览馆管理员','10','ee866e39f5a343ee8ba33b3a0594e211','200001','2','2','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-10-08 13:38:30','','0'),('86b3334b98c742909e09c86f40404070','fb2703e6dd1c493591a19f8dd7170027','0,1,fb2703e6dd1c493591a19f8dd7170027,','长春市展览馆','30','3','100000003002','1','3','','','','','','','1','','','1','2016-10-08 11:50:53','1','2016-10-08 11:51:16','','0'),('9','7','0,1,7,','综合部','20','3','200002','2','2',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('c7da93b87243499b8691279b64aee7c9','12','0,1,7,12,','沈阳市展览馆管理员','30','4429c7983e3c4728b1d853dc97c2420d','201000001','2','3','','','','','','','1','','','1','2016-10-08 14:03:39','1','2016-10-08 14:03:39','','0'),('ca5664b3b80f48759a30217dd440c2cd','12','0,1,7,12,','展厅一','30','4429c7983e3c4728b1d853dc97c2420d','201000002','1','3','','','','','','','1','','','1','2016-10-08 14:04:13','1','2016-10-08 14:04:13','','0'),('e14a7b00f5b74aaea989e5f5e724dfed','86b3334b98c742909e09c86f40404070','0,1,fb2703e6dd1c493591a19f8dd7170027,86b3334b98c742909e09c86f40404070,','长春市展览馆管理员','30','3','100000003002001','2','3','','','','','','','1','','','1','2016-10-08 13:38:06','1','2016-10-08 13:38:06','','0'),('fb2703e6dd1c493591a19f8dd7170027','1','0,1,','吉林省展览馆','30','2','100000003','1','2','','','','','','','1','','','1','2016-10-08 11:49:00','1','2016-10-08 11:50:06','','0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','2','系统管理员','dept','assignment','1','1','1','1','2013-05-27 08:00:00','1','2016-10-18 12:02:09','','0'),('173aeedbceef46babde811cec269b4c4','e14a7b00f5b74aaea989e5f5e724dfed','长春市展览馆管理员','ccsgly','assignment','2','1','1','1','2016-10-08 14:01:08','1','2016-10-08 14:01:08','','0'),('2','0acd4c2f5fe142258edd4ab5ffe6ad5b','吉林省展览馆管理员','gly','assignment','2','1','1','1','2013-05-27 08:00:00','1','2016-10-08 13:54:22','','0'),('270d3cc4b4f541ff9f3d11bab64bf410','8','辽宁省展览馆管理员','lnsgly','assignment','2','1','1','1','2016-10-08 14:07:16','1','2016-10-08 14:07:16','','0'),('3','1','本公司管理员','a','assignment','3',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','1','部门管理员','b','assignment','4',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47cd9f09fd0c467392921ee1340d749d','c7da93b87243499b8691279b64aee7c9','沈阳市展览馆管理员','sysgly','assignment','2','1','1','1','2016-10-08 14:07:59','1','2016-10-08 14:07:59','','0'),('5','1','本部门管理员','c','assignment','5',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','2','普通用户','d','assignment','1','1','1','1','2013-05-27 08:00:00','1','2016-06-02 10:49:25','','1'),('7','7','济南市管理员','e','assignment','9',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','00a7f20428a54a5db62295ecab9f92a4'),('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','17254e99a45f49a097abd2cf041825b8'),('1','18'),('1','19'),('1','1fcad9026fa9415f814f62f962023f85'),('1','2'),('1','20'),('1','21'),('1','22'),('1','227b128a47fe422e806e453aac974d53'),('1','23'),('1','24'),('1','27'),('1','28'),('1','29'),('1','2df2cd5ca9f9406ab3560a5386af0ea2'),('1','2fe057ef51784d73951979f70e5afecc'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','3732a34c00af43388240ffe4ad8489a3'),('1','38'),('1','39'),('1','3e320999938d44eaaea9c5542e3fa3f6'),('1','4'),('1','40'),('1','41'),('1','41bce4d151dd48049a73e440d2a50505'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','4d1d5051b56e4bcbb0daf603a6d3473d'),('1','4e1dd804ed2444dd98919f2eac47d112'),('1','4f1a0b9b0fbd48b488c576f4a480b022'),('1','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1'),('1','5'),('1','50'),('1','51'),('1','51f75adfe8b642518b5ff8b839664b34'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','58d0b78c555c4164ad858c50215e398a'),('1','59'),('1','5a41b8999b8343239a47d6e8288f90b1'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','675b1822b304489bb7571dd6c9aa8183'),('1','68'),('1','69'),('1','695d665d19a34a45928491eef463c177'),('1','6b7bce15847b4e72af5dbbe9a1a9e6d3'),('1','7'),('1','70'),('1','7086efa770b3497d967364cafe9c148f'),('1','71'),('1','72'),('1','73'),('1','74'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','84'),('1','85'),('1','88'),('1','89'),('1','8e30fa7f3ace4180826da9fa6ac4b694'),('1','9'),('1','90'),('1','9d458d0bc2c843ddaf16d63da0dbc689'),('1','9fcc920202e7441ba7c8134d02ac0eb0'),('1','a86dc0f1811744638519a2c8f754ce5c'),('1','a992c9fe83f145fbbaa704ce14a4ef01'),('1','ac3ff08440784058b37a6b79826d9fae'),('1','c433fe2b1cee4dc7a09a3c53b9778c0f'),('1','c45ed914b6924ed48b1666f243760cae'),('1','c54ba9edc75844c3a62e7d03b4ef240c'),('1','c96ca6d5d412493aa696d85406a5cad5'),('1','cd924730f8fb49519d0de987f3d3c184'),('1','d366e67d0b2c48f9a4591e857b26dd41'),('1','dc9069f7ddf4449981bb760f9a9b0f86'),('1','dffa585a19c44b619bc9ba52e83cd532'),('1','e031ccc2441045d79f3a1828c46b2989'),('1','e39290ba48604010ac67a83f11f1caa6'),('1','e42b390a6ba54ebd9ce79c7aa6a544dd'),('1','fbcd389dfa51461aa72d1eb94416eccf'),('173aeedbceef46babde811cec269b4c4','00a7f20428a54a5db62295ecab9f92a4'),('173aeedbceef46babde811cec269b4c4','04760cc372044016bfcaa1c363495f8b'),('173aeedbceef46babde811cec269b4c4','0b2ebd4d639e4c2b83c2dd0764522f24'),('173aeedbceef46babde811cec269b4c4','0ca004d6b1bf4bcab9670a5060d82a55'),('173aeedbceef46babde811cec269b4c4','1'),('173aeedbceef46babde811cec269b4c4','10'),('173aeedbceef46babde811cec269b4c4','11'),('173aeedbceef46babde811cec269b4c4','12'),('173aeedbceef46babde811cec269b4c4','13'),('173aeedbceef46babde811cec269b4c4','14'),('173aeedbceef46babde811cec269b4c4','15'),('173aeedbceef46babde811cec269b4c4','16'),('173aeedbceef46babde811cec269b4c4','17'),('173aeedbceef46babde811cec269b4c4','17254e99a45f49a097abd2cf041825b8'),('173aeedbceef46babde811cec269b4c4','18'),('173aeedbceef46babde811cec269b4c4','19'),('173aeedbceef46babde811cec269b4c4','1fcad9026fa9415f814f62f962023f85'),('173aeedbceef46babde811cec269b4c4','2'),('173aeedbceef46babde811cec269b4c4','20'),('173aeedbceef46babde811cec269b4c4','20dbc39ef95e49e8a647cfe82f4daa95'),('173aeedbceef46babde811cec269b4c4','21'),('173aeedbceef46babde811cec269b4c4','22'),('173aeedbceef46babde811cec269b4c4','227b128a47fe422e806e453aac974d53'),('173aeedbceef46babde811cec269b4c4','23'),('173aeedbceef46babde811cec269b4c4','24'),('173aeedbceef46babde811cec269b4c4','27'),('173aeedbceef46babde811cec269b4c4','28'),('173aeedbceef46babde811cec269b4c4','29'),('173aeedbceef46babde811cec269b4c4','2df2cd5ca9f9406ab3560a5386af0ea2'),('173aeedbceef46babde811cec269b4c4','2fe057ef51784d73951979f70e5afecc'),('173aeedbceef46babde811cec269b4c4','3'),('173aeedbceef46babde811cec269b4c4','30'),('173aeedbceef46babde811cec269b4c4','31'),('173aeedbceef46babde811cec269b4c4','32'),('173aeedbceef46babde811cec269b4c4','33'),('173aeedbceef46babde811cec269b4c4','34'),('173aeedbceef46babde811cec269b4c4','35'),('173aeedbceef46babde811cec269b4c4','36'),('173aeedbceef46babde811cec269b4c4','37'),('173aeedbceef46babde811cec269b4c4','3732a34c00af43388240ffe4ad8489a3'),('173aeedbceef46babde811cec269b4c4','38'),('173aeedbceef46babde811cec269b4c4','39'),('173aeedbceef46babde811cec269b4c4','3c92c17886944d0687e73e286cada573'),('173aeedbceef46babde811cec269b4c4','3e320999938d44eaaea9c5542e3fa3f6'),('173aeedbceef46babde811cec269b4c4','4'),('173aeedbceef46babde811cec269b4c4','40'),('173aeedbceef46babde811cec269b4c4','41'),('173aeedbceef46babde811cec269b4c4','41bce4d151dd48049a73e440d2a50505'),('173aeedbceef46babde811cec269b4c4','42'),('173aeedbceef46babde811cec269b4c4','43'),('173aeedbceef46babde811cec269b4c4','44'),('173aeedbceef46babde811cec269b4c4','45'),('173aeedbceef46babde811cec269b4c4','46'),('173aeedbceef46babde811cec269b4c4','47'),('173aeedbceef46babde811cec269b4c4','48'),('173aeedbceef46babde811cec269b4c4','4855cf3b25c244fb8500a380db189d97'),('173aeedbceef46babde811cec269b4c4','49'),('173aeedbceef46babde811cec269b4c4','497bf29eb3504019b0a6050c9aa2702d'),('173aeedbceef46babde811cec269b4c4','4bb3f18225ab4de7baa54aae8af6651e'),('173aeedbceef46babde811cec269b4c4','4d1d5051b56e4bcbb0daf603a6d3473d'),('173aeedbceef46babde811cec269b4c4','4e1dd804ed2444dd98919f2eac47d112'),('173aeedbceef46babde811cec269b4c4','4f1a0b9b0fbd48b488c576f4a480b022'),('173aeedbceef46babde811cec269b4c4','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1'),('173aeedbceef46babde811cec269b4c4','5'),('173aeedbceef46babde811cec269b4c4','50'),('173aeedbceef46babde811cec269b4c4','51'),('173aeedbceef46babde811cec269b4c4','51f75adfe8b642518b5ff8b839664b34'),('173aeedbceef46babde811cec269b4c4','52'),('173aeedbceef46babde811cec269b4c4','53'),('173aeedbceef46babde811cec269b4c4','54'),('173aeedbceef46babde811cec269b4c4','55'),('173aeedbceef46babde811cec269b4c4','56'),('173aeedbceef46babde811cec269b4c4','57'),('173aeedbceef46babde811cec269b4c4','58'),('173aeedbceef46babde811cec269b4c4','58d0b78c555c4164ad858c50215e398a'),('173aeedbceef46babde811cec269b4c4','59'),('173aeedbceef46babde811cec269b4c4','5a41b8999b8343239a47d6e8288f90b1'),('173aeedbceef46babde811cec269b4c4','6'),('173aeedbceef46babde811cec269b4c4','60'),('173aeedbceef46babde811cec269b4c4','61'),('173aeedbceef46babde811cec269b4c4','62'),('173aeedbceef46babde811cec269b4c4','63'),('173aeedbceef46babde811cec269b4c4','631a87ca081e4956aeee765f09c21094'),('173aeedbceef46babde811cec269b4c4','64'),('173aeedbceef46babde811cec269b4c4','65'),('173aeedbceef46babde811cec269b4c4','66'),('173aeedbceef46babde811cec269b4c4','67'),('173aeedbceef46babde811cec269b4c4','675b1822b304489bb7571dd6c9aa8183'),('173aeedbceef46babde811cec269b4c4','68'),('173aeedbceef46babde811cec269b4c4','69'),('173aeedbceef46babde811cec269b4c4','695d665d19a34a45928491eef463c177'),('173aeedbceef46babde811cec269b4c4','7'),('173aeedbceef46babde811cec269b4c4','70'),('173aeedbceef46babde811cec269b4c4','7086efa770b3497d967364cafe9c148f'),('173aeedbceef46babde811cec269b4c4','71'),('173aeedbceef46babde811cec269b4c4','72'),('173aeedbceef46babde811cec269b4c4','73'),('173aeedbceef46babde811cec269b4c4','74'),('173aeedbceef46babde811cec269b4c4','79'),('173aeedbceef46babde811cec269b4c4','8'),('173aeedbceef46babde811cec269b4c4','80'),('173aeedbceef46babde811cec269b4c4','81'),('173aeedbceef46babde811cec269b4c4','82'),('173aeedbceef46babde811cec269b4c4','84'),('173aeedbceef46babde811cec269b4c4','88'),('173aeedbceef46babde811cec269b4c4','89'),('173aeedbceef46babde811cec269b4c4','8e30fa7f3ace4180826da9fa6ac4b694'),('173aeedbceef46babde811cec269b4c4','9'),('173aeedbceef46babde811cec269b4c4','90'),('173aeedbceef46babde811cec269b4c4','9d458d0bc2c843ddaf16d63da0dbc689'),('173aeedbceef46babde811cec269b4c4','9fcc920202e7441ba7c8134d02ac0eb0'),('173aeedbceef46babde811cec269b4c4','a032b46de763467d9e5087866a4f5626'),('173aeedbceef46babde811cec269b4c4','a5e0169b98c64494b22ff41fae36828e'),('173aeedbceef46babde811cec269b4c4','a7b33e2abc9a49d69d206f29d73d1d6f'),('173aeedbceef46babde811cec269b4c4','a86dc0f1811744638519a2c8f754ce5c'),('173aeedbceef46babde811cec269b4c4','a8b2d57fbc11499da1a2a19e87afe2a7'),('173aeedbceef46babde811cec269b4c4','a992c9fe83f145fbbaa704ce14a4ef01'),('173aeedbceef46babde811cec269b4c4','ac3ff08440784058b37a6b79826d9fae'),('173aeedbceef46babde811cec269b4c4','afab2db430e2457f9cf3a11feaa8b869'),('173aeedbceef46babde811cec269b4c4','b0e3fbc3e69f4264b96ecae790dcb748'),('173aeedbceef46babde811cec269b4c4','b1f6d1b86ba24365bae7fd86c5082317'),('173aeedbceef46babde811cec269b4c4','b3783d9b71cb46ee925849f3f263e630'),('173aeedbceef46babde811cec269b4c4','ba8092291b40482db8fe7fc006ea3d76'),('173aeedbceef46babde811cec269b4c4','c2e4d9082a0b4386884a0b203afe2c5c'),('173aeedbceef46babde811cec269b4c4','c433fe2b1cee4dc7a09a3c53b9778c0f'),('173aeedbceef46babde811cec269b4c4','c45ed914b6924ed48b1666f243760cae'),('173aeedbceef46babde811cec269b4c4','c54ba9edc75844c3a62e7d03b4ef240c'),('173aeedbceef46babde811cec269b4c4','c96ca6d5d412493aa696d85406a5cad5'),('173aeedbceef46babde811cec269b4c4','cd924730f8fb49519d0de987f3d3c184'),('173aeedbceef46babde811cec269b4c4','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),('173aeedbceef46babde811cec269b4c4','d366e67d0b2c48f9a4591e857b26dd41'),('173aeedbceef46babde811cec269b4c4','dc9069f7ddf4449981bb760f9a9b0f86'),('173aeedbceef46babde811cec269b4c4','df7ce823c5b24ff9bada43d992f373e2'),('173aeedbceef46babde811cec269b4c4','dffa585a19c44b619bc9ba52e83cd532'),('173aeedbceef46babde811cec269b4c4','e031ccc2441045d79f3a1828c46b2989'),('173aeedbceef46babde811cec269b4c4','e39290ba48604010ac67a83f11f1caa6'),('173aeedbceef46babde811cec269b4c4','e42b390a6ba54ebd9ce79c7aa6a544dd'),('173aeedbceef46babde811cec269b4c4','eb98d24431b34608b0534e1d640beea2'),('173aeedbceef46babde811cec269b4c4','fa7e5d84de10402891dae5c0afcb0a08'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','84'),('2','85'),('2','88'),('2','89'),('2','9'),('2','90'),('270d3cc4b4f541ff9f3d11bab64bf410','00a7f20428a54a5db62295ecab9f92a4'),('270d3cc4b4f541ff9f3d11bab64bf410','04760cc372044016bfcaa1c363495f8b'),('270d3cc4b4f541ff9f3d11bab64bf410','0b2ebd4d639e4c2b83c2dd0764522f24'),('270d3cc4b4f541ff9f3d11bab64bf410','0ca004d6b1bf4bcab9670a5060d82a55'),('270d3cc4b4f541ff9f3d11bab64bf410','1'),('270d3cc4b4f541ff9f3d11bab64bf410','10'),('270d3cc4b4f541ff9f3d11bab64bf410','11'),('270d3cc4b4f541ff9f3d11bab64bf410','12'),('270d3cc4b4f541ff9f3d11bab64bf410','13'),('270d3cc4b4f541ff9f3d11bab64bf410','14'),('270d3cc4b4f541ff9f3d11bab64bf410','15'),('270d3cc4b4f541ff9f3d11bab64bf410','16'),('270d3cc4b4f541ff9f3d11bab64bf410','17'),('270d3cc4b4f541ff9f3d11bab64bf410','17254e99a45f49a097abd2cf041825b8'),('270d3cc4b4f541ff9f3d11bab64bf410','18'),('270d3cc4b4f541ff9f3d11bab64bf410','19'),('270d3cc4b4f541ff9f3d11bab64bf410','1fcad9026fa9415f814f62f962023f85'),('270d3cc4b4f541ff9f3d11bab64bf410','2'),('270d3cc4b4f541ff9f3d11bab64bf410','20'),('270d3cc4b4f541ff9f3d11bab64bf410','20dbc39ef95e49e8a647cfe82f4daa95'),('270d3cc4b4f541ff9f3d11bab64bf410','21'),('270d3cc4b4f541ff9f3d11bab64bf410','22'),('270d3cc4b4f541ff9f3d11bab64bf410','227b128a47fe422e806e453aac974d53'),('270d3cc4b4f541ff9f3d11bab64bf410','23'),('270d3cc4b4f541ff9f3d11bab64bf410','24'),('270d3cc4b4f541ff9f3d11bab64bf410','27'),('270d3cc4b4f541ff9f3d11bab64bf410','28'),('270d3cc4b4f541ff9f3d11bab64bf410','29'),('270d3cc4b4f541ff9f3d11bab64bf410','2df2cd5ca9f9406ab3560a5386af0ea2'),('270d3cc4b4f541ff9f3d11bab64bf410','2fe057ef51784d73951979f70e5afecc'),('270d3cc4b4f541ff9f3d11bab64bf410','3'),('270d3cc4b4f541ff9f3d11bab64bf410','30'),('270d3cc4b4f541ff9f3d11bab64bf410','31'),('270d3cc4b4f541ff9f3d11bab64bf410','32'),('270d3cc4b4f541ff9f3d11bab64bf410','33'),('270d3cc4b4f541ff9f3d11bab64bf410','34'),('270d3cc4b4f541ff9f3d11bab64bf410','35'),('270d3cc4b4f541ff9f3d11bab64bf410','36'),('270d3cc4b4f541ff9f3d11bab64bf410','37'),('270d3cc4b4f541ff9f3d11bab64bf410','3732a34c00af43388240ffe4ad8489a3'),('270d3cc4b4f541ff9f3d11bab64bf410','38'),('270d3cc4b4f541ff9f3d11bab64bf410','39'),('270d3cc4b4f541ff9f3d11bab64bf410','3c92c17886944d0687e73e286cada573'),('270d3cc4b4f541ff9f3d11bab64bf410','3e320999938d44eaaea9c5542e3fa3f6'),('270d3cc4b4f541ff9f3d11bab64bf410','4'),('270d3cc4b4f541ff9f3d11bab64bf410','40'),('270d3cc4b4f541ff9f3d11bab64bf410','41'),('270d3cc4b4f541ff9f3d11bab64bf410','41bce4d151dd48049a73e440d2a50505'),('270d3cc4b4f541ff9f3d11bab64bf410','42'),('270d3cc4b4f541ff9f3d11bab64bf410','43'),('270d3cc4b4f541ff9f3d11bab64bf410','44'),('270d3cc4b4f541ff9f3d11bab64bf410','45'),('270d3cc4b4f541ff9f3d11bab64bf410','46'),('270d3cc4b4f541ff9f3d11bab64bf410','47'),('270d3cc4b4f541ff9f3d11bab64bf410','48'),('270d3cc4b4f541ff9f3d11bab64bf410','4855cf3b25c244fb8500a380db189d97'),('270d3cc4b4f541ff9f3d11bab64bf410','49'),('270d3cc4b4f541ff9f3d11bab64bf410','497bf29eb3504019b0a6050c9aa2702d'),('270d3cc4b4f541ff9f3d11bab64bf410','4bb3f18225ab4de7baa54aae8af6651e'),('270d3cc4b4f541ff9f3d11bab64bf410','4d1d5051b56e4bcbb0daf603a6d3473d'),('270d3cc4b4f541ff9f3d11bab64bf410','4e1dd804ed2444dd98919f2eac47d112'),('270d3cc4b4f541ff9f3d11bab64bf410','4f1a0b9b0fbd48b488c576f4a480b022'),('270d3cc4b4f541ff9f3d11bab64bf410','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1'),('270d3cc4b4f541ff9f3d11bab64bf410','5'),('270d3cc4b4f541ff9f3d11bab64bf410','50'),('270d3cc4b4f541ff9f3d11bab64bf410','51'),('270d3cc4b4f541ff9f3d11bab64bf410','51f75adfe8b642518b5ff8b839664b34'),('270d3cc4b4f541ff9f3d11bab64bf410','52'),('270d3cc4b4f541ff9f3d11bab64bf410','53'),('270d3cc4b4f541ff9f3d11bab64bf410','54'),('270d3cc4b4f541ff9f3d11bab64bf410','55'),('270d3cc4b4f541ff9f3d11bab64bf410','56'),('270d3cc4b4f541ff9f3d11bab64bf410','57'),('270d3cc4b4f541ff9f3d11bab64bf410','58'),('270d3cc4b4f541ff9f3d11bab64bf410','58d0b78c555c4164ad858c50215e398a'),('270d3cc4b4f541ff9f3d11bab64bf410','59'),('270d3cc4b4f541ff9f3d11bab64bf410','5a41b8999b8343239a47d6e8288f90b1'),('270d3cc4b4f541ff9f3d11bab64bf410','6'),('270d3cc4b4f541ff9f3d11bab64bf410','60'),('270d3cc4b4f541ff9f3d11bab64bf410','61'),('270d3cc4b4f541ff9f3d11bab64bf410','62'),('270d3cc4b4f541ff9f3d11bab64bf410','63'),('270d3cc4b4f541ff9f3d11bab64bf410','631a87ca081e4956aeee765f09c21094'),('270d3cc4b4f541ff9f3d11bab64bf410','64'),('270d3cc4b4f541ff9f3d11bab64bf410','65'),('270d3cc4b4f541ff9f3d11bab64bf410','66'),('270d3cc4b4f541ff9f3d11bab64bf410','67'),('270d3cc4b4f541ff9f3d11bab64bf410','675b1822b304489bb7571dd6c9aa8183'),('270d3cc4b4f541ff9f3d11bab64bf410','68'),('270d3cc4b4f541ff9f3d11bab64bf410','69'),('270d3cc4b4f541ff9f3d11bab64bf410','695d665d19a34a45928491eef463c177'),('270d3cc4b4f541ff9f3d11bab64bf410','7'),('270d3cc4b4f541ff9f3d11bab64bf410','70'),('270d3cc4b4f541ff9f3d11bab64bf410','7086efa770b3497d967364cafe9c148f'),('270d3cc4b4f541ff9f3d11bab64bf410','71'),('270d3cc4b4f541ff9f3d11bab64bf410','72'),('270d3cc4b4f541ff9f3d11bab64bf410','73'),('270d3cc4b4f541ff9f3d11bab64bf410','74'),('270d3cc4b4f541ff9f3d11bab64bf410','79'),('270d3cc4b4f541ff9f3d11bab64bf410','8'),('270d3cc4b4f541ff9f3d11bab64bf410','80'),('270d3cc4b4f541ff9f3d11bab64bf410','81'),('270d3cc4b4f541ff9f3d11bab64bf410','82'),('270d3cc4b4f541ff9f3d11bab64bf410','84'),('270d3cc4b4f541ff9f3d11bab64bf410','88'),('270d3cc4b4f541ff9f3d11bab64bf410','89'),('270d3cc4b4f541ff9f3d11bab64bf410','8e30fa7f3ace4180826da9fa6ac4b694'),('270d3cc4b4f541ff9f3d11bab64bf410','9'),('270d3cc4b4f541ff9f3d11bab64bf410','90'),('270d3cc4b4f541ff9f3d11bab64bf410','9d458d0bc2c843ddaf16d63da0dbc689'),('270d3cc4b4f541ff9f3d11bab64bf410','9fcc920202e7441ba7c8134d02ac0eb0'),('270d3cc4b4f541ff9f3d11bab64bf410','a032b46de763467d9e5087866a4f5626'),('270d3cc4b4f541ff9f3d11bab64bf410','a5e0169b98c64494b22ff41fae36828e'),('270d3cc4b4f541ff9f3d11bab64bf410','a7b33e2abc9a49d69d206f29d73d1d6f'),('270d3cc4b4f541ff9f3d11bab64bf410','a86dc0f1811744638519a2c8f754ce5c'),('270d3cc4b4f541ff9f3d11bab64bf410','a8b2d57fbc11499da1a2a19e87afe2a7'),('270d3cc4b4f541ff9f3d11bab64bf410','a992c9fe83f145fbbaa704ce14a4ef01'),('270d3cc4b4f541ff9f3d11bab64bf410','ac3ff08440784058b37a6b79826d9fae'),('270d3cc4b4f541ff9f3d11bab64bf410','afab2db430e2457f9cf3a11feaa8b869'),('270d3cc4b4f541ff9f3d11bab64bf410','b0e3fbc3e69f4264b96ecae790dcb748'),('270d3cc4b4f541ff9f3d11bab64bf410','b1f6d1b86ba24365bae7fd86c5082317'),('270d3cc4b4f541ff9f3d11bab64bf410','b3783d9b71cb46ee925849f3f263e630'),('270d3cc4b4f541ff9f3d11bab64bf410','ba8092291b40482db8fe7fc006ea3d76'),('270d3cc4b4f541ff9f3d11bab64bf410','c2e4d9082a0b4386884a0b203afe2c5c'),('270d3cc4b4f541ff9f3d11bab64bf410','c433fe2b1cee4dc7a09a3c53b9778c0f'),('270d3cc4b4f541ff9f3d11bab64bf410','c45ed914b6924ed48b1666f243760cae'),('270d3cc4b4f541ff9f3d11bab64bf410','c54ba9edc75844c3a62e7d03b4ef240c'),('270d3cc4b4f541ff9f3d11bab64bf410','c96ca6d5d412493aa696d85406a5cad5'),('270d3cc4b4f541ff9f3d11bab64bf410','cd924730f8fb49519d0de987f3d3c184'),('270d3cc4b4f541ff9f3d11bab64bf410','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),('270d3cc4b4f541ff9f3d11bab64bf410','d366e67d0b2c48f9a4591e857b26dd41'),('270d3cc4b4f541ff9f3d11bab64bf410','dc9069f7ddf4449981bb760f9a9b0f86'),('270d3cc4b4f541ff9f3d11bab64bf410','df7ce823c5b24ff9bada43d992f373e2'),('270d3cc4b4f541ff9f3d11bab64bf410','dffa585a19c44b619bc9ba52e83cd532'),('270d3cc4b4f541ff9f3d11bab64bf410','e031ccc2441045d79f3a1828c46b2989'),('270d3cc4b4f541ff9f3d11bab64bf410','e39290ba48604010ac67a83f11f1caa6'),('270d3cc4b4f541ff9f3d11bab64bf410','e42b390a6ba54ebd9ce79c7aa6a544dd'),('270d3cc4b4f541ff9f3d11bab64bf410','eb98d24431b34608b0534e1d640beea2'),('270d3cc4b4f541ff9f3d11bab64bf410','fa7e5d84de10402891dae5c0afcb0a08'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','73'),('3','74'),('3','75'),('3','76'),('3','77'),('3','78'),('3','79'),('3','8'),('3','80'),('3','81'),('3','82'),('3','83'),('3','84'),('3','85'),('3','86'),('3','87'),('3','88'),('3','89'),('3','9'),('3','90'),('47cd9f09fd0c467392921ee1340d749d','00a7f20428a54a5db62295ecab9f92a4'),('47cd9f09fd0c467392921ee1340d749d','04760cc372044016bfcaa1c363495f8b'),('47cd9f09fd0c467392921ee1340d749d','0b2ebd4d639e4c2b83c2dd0764522f24'),('47cd9f09fd0c467392921ee1340d749d','0ca004d6b1bf4bcab9670a5060d82a55'),('47cd9f09fd0c467392921ee1340d749d','1'),('47cd9f09fd0c467392921ee1340d749d','10'),('47cd9f09fd0c467392921ee1340d749d','11'),('47cd9f09fd0c467392921ee1340d749d','12'),('47cd9f09fd0c467392921ee1340d749d','13'),('47cd9f09fd0c467392921ee1340d749d','14'),('47cd9f09fd0c467392921ee1340d749d','15'),('47cd9f09fd0c467392921ee1340d749d','16'),('47cd9f09fd0c467392921ee1340d749d','17'),('47cd9f09fd0c467392921ee1340d749d','17254e99a45f49a097abd2cf041825b8'),('47cd9f09fd0c467392921ee1340d749d','18'),('47cd9f09fd0c467392921ee1340d749d','19'),('47cd9f09fd0c467392921ee1340d749d','1fcad9026fa9415f814f62f962023f85'),('47cd9f09fd0c467392921ee1340d749d','2'),('47cd9f09fd0c467392921ee1340d749d','20'),('47cd9f09fd0c467392921ee1340d749d','20dbc39ef95e49e8a647cfe82f4daa95'),('47cd9f09fd0c467392921ee1340d749d','21'),('47cd9f09fd0c467392921ee1340d749d','22'),('47cd9f09fd0c467392921ee1340d749d','227b128a47fe422e806e453aac974d53'),('47cd9f09fd0c467392921ee1340d749d','23'),('47cd9f09fd0c467392921ee1340d749d','24'),('47cd9f09fd0c467392921ee1340d749d','27'),('47cd9f09fd0c467392921ee1340d749d','28'),('47cd9f09fd0c467392921ee1340d749d','29'),('47cd9f09fd0c467392921ee1340d749d','2df2cd5ca9f9406ab3560a5386af0ea2'),('47cd9f09fd0c467392921ee1340d749d','2fe057ef51784d73951979f70e5afecc'),('47cd9f09fd0c467392921ee1340d749d','3'),('47cd9f09fd0c467392921ee1340d749d','30'),('47cd9f09fd0c467392921ee1340d749d','31'),('47cd9f09fd0c467392921ee1340d749d','32'),('47cd9f09fd0c467392921ee1340d749d','33'),('47cd9f09fd0c467392921ee1340d749d','34'),('47cd9f09fd0c467392921ee1340d749d','35'),('47cd9f09fd0c467392921ee1340d749d','36'),('47cd9f09fd0c467392921ee1340d749d','37'),('47cd9f09fd0c467392921ee1340d749d','3732a34c00af43388240ffe4ad8489a3'),('47cd9f09fd0c467392921ee1340d749d','38'),('47cd9f09fd0c467392921ee1340d749d','39'),('47cd9f09fd0c467392921ee1340d749d','3c92c17886944d0687e73e286cada573'),('47cd9f09fd0c467392921ee1340d749d','3e320999938d44eaaea9c5542e3fa3f6'),('47cd9f09fd0c467392921ee1340d749d','4'),('47cd9f09fd0c467392921ee1340d749d','40'),('47cd9f09fd0c467392921ee1340d749d','41'),('47cd9f09fd0c467392921ee1340d749d','41bce4d151dd48049a73e440d2a50505'),('47cd9f09fd0c467392921ee1340d749d','42'),('47cd9f09fd0c467392921ee1340d749d','43'),('47cd9f09fd0c467392921ee1340d749d','44'),('47cd9f09fd0c467392921ee1340d749d','45'),('47cd9f09fd0c467392921ee1340d749d','46'),('47cd9f09fd0c467392921ee1340d749d','47'),('47cd9f09fd0c467392921ee1340d749d','48'),('47cd9f09fd0c467392921ee1340d749d','4855cf3b25c244fb8500a380db189d97'),('47cd9f09fd0c467392921ee1340d749d','49'),('47cd9f09fd0c467392921ee1340d749d','497bf29eb3504019b0a6050c9aa2702d'),('47cd9f09fd0c467392921ee1340d749d','4bb3f18225ab4de7baa54aae8af6651e'),('47cd9f09fd0c467392921ee1340d749d','4d1d5051b56e4bcbb0daf603a6d3473d'),('47cd9f09fd0c467392921ee1340d749d','4e1dd804ed2444dd98919f2eac47d112'),('47cd9f09fd0c467392921ee1340d749d','4f1a0b9b0fbd48b488c576f4a480b022'),('47cd9f09fd0c467392921ee1340d749d','4f7c8f4e7e4a4a2a9e02e8a66d6c4ca1'),('47cd9f09fd0c467392921ee1340d749d','5'),('47cd9f09fd0c467392921ee1340d749d','50'),('47cd9f09fd0c467392921ee1340d749d','51'),('47cd9f09fd0c467392921ee1340d749d','51f75adfe8b642518b5ff8b839664b34'),('47cd9f09fd0c467392921ee1340d749d','52'),('47cd9f09fd0c467392921ee1340d749d','53'),('47cd9f09fd0c467392921ee1340d749d','54'),('47cd9f09fd0c467392921ee1340d749d','55'),('47cd9f09fd0c467392921ee1340d749d','56'),('47cd9f09fd0c467392921ee1340d749d','57'),('47cd9f09fd0c467392921ee1340d749d','58'),('47cd9f09fd0c467392921ee1340d749d','58d0b78c555c4164ad858c50215e398a'),('47cd9f09fd0c467392921ee1340d749d','59'),('47cd9f09fd0c467392921ee1340d749d','5a41b8999b8343239a47d6e8288f90b1'),('47cd9f09fd0c467392921ee1340d749d','6'),('47cd9f09fd0c467392921ee1340d749d','60'),('47cd9f09fd0c467392921ee1340d749d','61'),('47cd9f09fd0c467392921ee1340d749d','62'),('47cd9f09fd0c467392921ee1340d749d','63'),('47cd9f09fd0c467392921ee1340d749d','631a87ca081e4956aeee765f09c21094'),('47cd9f09fd0c467392921ee1340d749d','64'),('47cd9f09fd0c467392921ee1340d749d','65'),('47cd9f09fd0c467392921ee1340d749d','66'),('47cd9f09fd0c467392921ee1340d749d','67'),('47cd9f09fd0c467392921ee1340d749d','675b1822b304489bb7571dd6c9aa8183'),('47cd9f09fd0c467392921ee1340d749d','68'),('47cd9f09fd0c467392921ee1340d749d','69'),('47cd9f09fd0c467392921ee1340d749d','695d665d19a34a45928491eef463c177'),('47cd9f09fd0c467392921ee1340d749d','7'),('47cd9f09fd0c467392921ee1340d749d','70'),('47cd9f09fd0c467392921ee1340d749d','7086efa770b3497d967364cafe9c148f'),('47cd9f09fd0c467392921ee1340d749d','71'),('47cd9f09fd0c467392921ee1340d749d','72'),('47cd9f09fd0c467392921ee1340d749d','73'),('47cd9f09fd0c467392921ee1340d749d','74'),('47cd9f09fd0c467392921ee1340d749d','79'),('47cd9f09fd0c467392921ee1340d749d','8'),('47cd9f09fd0c467392921ee1340d749d','80'),('47cd9f09fd0c467392921ee1340d749d','81'),('47cd9f09fd0c467392921ee1340d749d','82'),('47cd9f09fd0c467392921ee1340d749d','84'),('47cd9f09fd0c467392921ee1340d749d','88'),('47cd9f09fd0c467392921ee1340d749d','89'),('47cd9f09fd0c467392921ee1340d749d','8e30fa7f3ace4180826da9fa6ac4b694'),('47cd9f09fd0c467392921ee1340d749d','9'),('47cd9f09fd0c467392921ee1340d749d','90'),('47cd9f09fd0c467392921ee1340d749d','9d458d0bc2c843ddaf16d63da0dbc689'),('47cd9f09fd0c467392921ee1340d749d','9fcc920202e7441ba7c8134d02ac0eb0'),('47cd9f09fd0c467392921ee1340d749d','a032b46de763467d9e5087866a4f5626'),('47cd9f09fd0c467392921ee1340d749d','a5e0169b98c64494b22ff41fae36828e'),('47cd9f09fd0c467392921ee1340d749d','a7b33e2abc9a49d69d206f29d73d1d6f'),('47cd9f09fd0c467392921ee1340d749d','a86dc0f1811744638519a2c8f754ce5c'),('47cd9f09fd0c467392921ee1340d749d','a8b2d57fbc11499da1a2a19e87afe2a7'),('47cd9f09fd0c467392921ee1340d749d','a992c9fe83f145fbbaa704ce14a4ef01'),('47cd9f09fd0c467392921ee1340d749d','ac3ff08440784058b37a6b79826d9fae'),('47cd9f09fd0c467392921ee1340d749d','afab2db430e2457f9cf3a11feaa8b869'),('47cd9f09fd0c467392921ee1340d749d','b0e3fbc3e69f4264b96ecae790dcb748'),('47cd9f09fd0c467392921ee1340d749d','b1f6d1b86ba24365bae7fd86c5082317'),('47cd9f09fd0c467392921ee1340d749d','b3783d9b71cb46ee925849f3f263e630'),('47cd9f09fd0c467392921ee1340d749d','ba8092291b40482db8fe7fc006ea3d76'),('47cd9f09fd0c467392921ee1340d749d','c2e4d9082a0b4386884a0b203afe2c5c'),('47cd9f09fd0c467392921ee1340d749d','c433fe2b1cee4dc7a09a3c53b9778c0f'),('47cd9f09fd0c467392921ee1340d749d','c45ed914b6924ed48b1666f243760cae'),('47cd9f09fd0c467392921ee1340d749d','c54ba9edc75844c3a62e7d03b4ef240c'),('47cd9f09fd0c467392921ee1340d749d','c96ca6d5d412493aa696d85406a5cad5'),('47cd9f09fd0c467392921ee1340d749d','cd924730f8fb49519d0de987f3d3c184'),('47cd9f09fd0c467392921ee1340d749d','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),('47cd9f09fd0c467392921ee1340d749d','d366e67d0b2c48f9a4591e857b26dd41'),('47cd9f09fd0c467392921ee1340d749d','dc9069f7ddf4449981bb760f9a9b0f86'),('47cd9f09fd0c467392921ee1340d749d','df7ce823c5b24ff9bada43d992f373e2'),('47cd9f09fd0c467392921ee1340d749d','dffa585a19c44b619bc9ba52e83cd532'),('47cd9f09fd0c467392921ee1340d749d','e031ccc2441045d79f3a1828c46b2989'),('47cd9f09fd0c467392921ee1340d749d','e39290ba48604010ac67a83f11f1caa6'),('47cd9f09fd0c467392921ee1340d749d','e42b390a6ba54ebd9ce79c7aa6a544dd'),('47cd9f09fd0c467392921ee1340d749d','eb98d24431b34608b0534e1d640beea2'),('47cd9f09fd0c467392921ee1340d749d','fa7e5d84de10402891dae5c0afcb0a08'),('6','1'),('6','27'),('6','28'),('6','29'),('6','30'),('6','56'),('6','57'),('6','71');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','1','2','thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','系统管理员','thinkgem@163.com','8675','8675',NULL,NULL,'127.0.0.1','2016-11-30 17:28:38','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00','最高管理员','0'),('10','86b3334b98c742909e09c86f40404070','e14a7b00f5b74aaea989e5f5e724dfed','ccsgly','705602f44e46134a5966f7600b77c6f7dcf36962b4d1743e03513c3e','0010','长春市管理员','','','','1','',NULL,NULL,'1','1','2013-05-27 08:00:00','1','2016-10-08 14:14:42','','0'),('11','12','13','lc_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0011','济南历城领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('12','12','18','lx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0012','济南历下领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('13','22','23','gx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','济南高新领导',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','1','2','sd_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','管理员',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('3','1','3','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','综合部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','1','4','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','市场部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','5','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','技术部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','1','6','sd_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','研发部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('7','7','8','lnsgly','e1dc1140f25acfbe8b88739934313c4fccd76ee4180b93243dae4454','0007','辽宁省管理员','','','','1','',NULL,NULL,'1','1','2013-05-27 08:00:00','1','2016-10-08 14:11:45','','0'),('8','12','c7da93b87243499b8691279b64aee7c9','sysgly','82ccad37489f50824b5b1828fa4c6fa13636eae3a55c8ee1fbc34e42','0008','沈阳市管理员','','','','1','',NULL,NULL,'1','1','2013-05-27 08:00:00','1','2016-10-08 14:12:56','','0'),('9','fb2703e6dd1c493591a19f8dd7170027','0acd4c2f5fe142258edd4ab5ffe6ad5b','jlsgly','b40569dee73a0df105711feaf9b9c9e3292ddf784292346538969eac','0009','吉林省管理员','','','','1','',NULL,NULL,'1','1','2013-05-27 08:00:00','1','2016-10-08 14:13:46','','0'),('c7104620e77443c3afa32bbb25f22337','1','2','fudd','f0b9ba38bc5995bd00e8848d35818b1e6527b39e54634318b61a80fc','001','111','','','','1','','127.0.0.1','2016-06-02 11:22:46','1','1','2016-06-02 10:45:28','1','2016-06-02 10:45:28','','1');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1','1'),('1','2'),('10','173aeedbceef46babde811cec269b4c4'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('3','2'),('4','3'),('5','4'),('6','5'),('7','270d3cc4b4f541ff9f3d11bab64bf410'),('8','47cd9f09fd0c467392921ee1340d749d'),('9','1'),('9','2'),('c7104620e77443c3afa32bbb25f22337','6');

/*Table structure for table `test_data` */

DROP TABLE IF EXISTS `test_data`;

CREATE TABLE `test_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

/*Data for the table `test_data` */

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

/*Data for the table `test_data_child` */

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

/*Data for the table `test_data_main` */

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';

/*Data for the table `test_tree` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;