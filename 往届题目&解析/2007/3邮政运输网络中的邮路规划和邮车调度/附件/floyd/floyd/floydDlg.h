// floydDlg.h : ͷ�ļ�

#pragma once
#include "atlcomtime.h"
#include "afxwin.h"
#include <afxtempl.h>
#include <fstream>
#include <iostream>
using namespace std;
#define LOW 0
#define UP 79
#define Max 99999

// CfloydDlg �Ի���
class CfloydDlg : public CDialog
{
// ����
public:
	CfloydDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_FLOYD_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	CString m_Mess;
	afx_msg void OnBnClickedButton1();
	int m_Max;
	int i,j,k;
	int d[UP][UP],r[UP][UP];
	void findway(int i, int j);
	int w[UP];
	int s[UP][UP];
	int RR[UP];
	CString path22;
	//struct Road 
	//{
	//	Road *head,*tail;
	//	int num;
	//}road[UP];
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedButton3();
};
