// floydDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "floyd.h"
#include "floydDlg.h"
#include ".\floyddlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// �Ի�������
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()


// CfloydDlg �Ի���



CfloydDlg::CfloydDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CfloydDlg::IDD, pParent)
	, m_Mess(_T(""))
	, m_Max(0)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CfloydDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, IDC_EDIT1, m_Mess);
	DDX_Text(pDX, IDC_EDIT2, m_Max);
}

BEGIN_MESSAGE_MAP(CfloydDlg, CDialog)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTON1, OnBnClickedButton1)
	ON_BN_CLICKED(IDC_BUTTON2, OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BUTTON3, OnBnClickedButton3)
END_MESSAGE_MAP()


// CfloydDlg ��Ϣ�������

BOOL CfloydDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// ��\������...\���˵�����ӵ�ϵͳ�˵��С�

	// IDM_ABOUTBOX ������ϵͳ���Χ�ڡ�
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// ���ô˶Ի����ͼ�ꡣ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	// TODO: �ڴ���Ӷ���ĳ�ʼ������

	
	return TRUE;  // ���������˿ؼ��Ľ��㣬���򷵻� TRUE
}

void CfloydDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CfloydDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ��������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù����ʾ��
HCURSOR CfloydDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CfloydDlg::OnBnClickedButton1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CString path;
	ifstream infile;
	char data[1000];
	char Data1[20],Data2[20],Data3[20];	
	//int temp;
	static char BASED_CODE szBuffer[]=
		"Text files(*.txt)|*.txt|All files(*.*)|*.*||";
	//���ĵ�	
	MessageBox("��ѡ�������ĵ�","�������ĵ�",MB_OK);
	CFileDialog dlg(TRUE,NULL,NULL,NULL,szBuffer);
	if(dlg.DoModal()==IDOK)
	{
		path=dlg.GetPathName();
	}
	else
		return;
	infile.open(path);
	//��ʼ�������ȡ����
	for (i=0;i<UP;i++)
	{
		for (j=0;j<UP;j++)
		{
			d[i][j]=Max;
			r[i][j]=0;
		}
		d[i][i]=0;
	}
	while (!infile.eof())
	{
		infile>>Data1;
		infile>>Data2;
		infile>>Data3;        
		if (atol(Data1)<UP && atol(Data2)<UP)
		{
			d[atol(Data1)][atol(Data2)]=atol(Data3);
			d[atol(Data2)][atol(Data1)]=atol(Data3);			
		}
		//if (atol(Data1)==74 && atol(Data2)<UP)
		//{
		//	d[atol(Data1)-74][atol(Data2)]=atol(Data3);
		//	d[atol(Data2)][atol(Data1)-74]=atol(Data3);
		//}		
	}
	for (i=LOW+1;i<UP;i++)
	{
		d[LOW][i]=d[0][i];
		d[i][LOW]=d[i][0];
	}
	infile.close();	
	
	//************************���ļ����************************
	MessageBox("���ļ����floyd���","���ļ�",MB_OK);
	CFileDialog dlg1(FALSE,NULL,NULL,NULL,szBuffer);
	if (dlg1.DoModal()==IDOK)
	{
		path=dlg1.GetPathName();
	}
	else
		return;
	ofstream outfile;
	outfile.open(path,ios::out|ios::trunc);

	//************************���ԭʼ����************************
	outfile<<"  ";
	for (i=LOW;i<UP;i++)
	{
		if (i==LOW)
		{
			outfile<<0<<" ";
		}
		else
		{
			outfile<<i<<" ";
		}
	}
	outfile<<endl;
	for (i=LOW;i<UP;i++)
	{
		if (i==LOW)
		{
			outfile<<0<<"     ";
		}
		else
		{
			outfile<<i<<"     ";
		}		
		for (j=LOW;j<UP;j++)
		{
			sprintf(data,"%7d",d[i][j]);
			outfile<<data<<" ";
		}
		outfile<<endl;
	}
	//for (i=0;i<UP;i++)
	//{
	//	for (j=i+1;j<UP;j++)
	//	{
	//		if (d[i][j]!=Max)
	//		{
	//			outfile<<i<<" "<<j<<" "<<d[i][j]<<endl;
	//		}			
	//	}
	//}
	//************************Froyd************************
	for(k=LOW;k<UP;k++)
	{
		for(i=LOW;i<UP;i++)
		{
			for(j=LOW;j<UP;j++)
			{
				if(d[i][k]+d[k][j]<d[i][j])
				{
					d[i][j]=d[i][k]+d[k][j];
					r[i][j]=k;
				}
			}
		}
	}

	//************************�����������************************
	outfile<<"  ";
	for (i=LOW;i<UP;i++)
	{
		if (i==LOW)
		{
			outfile<<0<<" ";
		}
		else
		{
			outfile<<i<<" ";
		}
	}
	outfile<<endl;
	for (i=LOW;i<UP;i++)
	{
		if (i==LOW)
		{
			outfile<<0<<" ";
		}
		else
		{
			outfile<<i<<" ";
		}		
		for (j=LOW;j<UP;j++)
		{
			sprintf(data,"%d",d[i][j]);
			outfile<<data<<" ";
		}
		outfile<<endl;
	}	
	if (LOW!=0)
	{
		for (i=LOW;i<UP;i++)
		{
			outfile<<0<<" "<<i<<" "<<d[0][i]<<endl;
		}
	}
//***************************************************************
	//for (i=1;i<UP;i++)
	//{
	//	for (j=1;j<i+1;j++)
	//	{
	//		s[i][j]=d[0][i]+d[0][j]-d[i][j];
	//		if (i==j)
	//		{
	//			s[i][j]=0;
	//		}
	//		sprintf(data,"%d",s[i][j]);
	//		outfile<<data<<" ";
	//	}
	//	outfile<<endl;
	//}
	
	//for (i=LOW;i<UP;i++)
	//{
	//	for (j=i+1;j<UP;j++)
	//	{
	//		outfile<<i<<" "<<j<<" "<<d[i][j]<<endl;						
	//	}
	//}
	//************************·�����************************
	for(i=LOW;i<UP;i++)
	{
		for(j=i+1;j<UP;j++)
		{	
			for(k=LOW;k<UP;k++)
			{
				w[k]=0;
			}
			w[i]=j;
			findway(i,j);
			if(i!=j)
			{	
				if (i==LOW)
				{
					sprintf(data,"%4d",0);
				}
				else
				{
					sprintf(data,"%4d",i);
				}				
				outfile<<data<<" ";
				k=i;
				while(k!=j)
				{
					if (w[k]==LOW)
					{
						sprintf(data,"%4d",0);
					}
					else
					{
						sprintf(data,"%4d",w[k]);
					}						
					outfile<<" "<<data;					
					k=w[k];
				}
				outfile<<endl;
			}
		}
		/*outfile<<endl;*/
	}
	outfile.close();
	//////////////////////////////////////////////////////////////////////////
	
}

void CfloydDlg::findway(int i, int j)
{
	int k;
	k=r[i][j];
	if (k!=0)
	{
		w[k]=w[i];
		w[i]=k;
		findway(i,k);
		findway(k,j);
	}
}


void CfloydDlg::OnBnClickedButton2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	static char BASED_CODE szBuffer[]=
		"Text files(*.txt)|*.txt|All files(*.*)|*.*||";
	CFileDialog dlg(TRUE,NULL,NULL,NULL,szBuffer);
	if(dlg.DoModal()==IDOK)
	{
		path22=dlg.GetPathName();
	}
	else
		return;
}

void CfloydDlg::OnBnClickedButton3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	ifstream infile;
	infile.open(path22);
	char dataa[25];
	//for (i=0;i<UP;i++)
	//{
	//	RR[i]="888";
	//}
	i=0;
	while (!infile.eof())
	{
		infile>>dataa;
		if (dataa=="D")
		{
			RR[i]=0;
		}
		else if (dataa=="X1")
		{
			RR[i]=74;
		}
		else if (dataa=="X2")
		{
			RR[i]=75;
		}
		else if (dataa=="X3")
		{
			RR[i]=76;
		}
		else if (dataa=="X4")
		{
			RR[i]=77;
		}
		else if (dataa=="X5")
		{
			RR[i]=78;
		}
		else
		{
			RR[i]=atol(dataa);
		}
		i=i+1;
	}
	
}
