<#
## ? v6_y.ps1 �ű�˵��

===========================================================#
�ű����ƣ�v6_y.ps1
�ű����ߣ�Stephen Tseng | https://www.ynewtime.com
�ű����ܣ��Զ�ʶ�𱾻�����������Ϊ�� IPv6
Ĭ�Ϲ��ܣ�v6_y.ps1 -->
 1. Ĭ�ϲ���Ҫ����
 2. �Զ�ʶ��ǰʱ���Ƿ�Ϊ�����Ķ���ʱ��
 3. ��Ϊ�Ƕ���ʱ�䣬�����õ��ԣ�1������ IPv6����2����� HOST ����
 4. ��Ϊ����ʱ�䣬��1�����ñ��ص� IPv4����2������ IPv6 DNS �� HOST
��ѡ������v6_y.ps1 2 --> 
 *. ������� 2�����ֹ�������������������� IPv6 ���ܣ���������Ϊ�� IPv4
����˵������ IPv4 ��ƽʱ�Ƕ���ʱ������ʹ�õ�����������˲�û�п��� IPv6��
������ʾ���� IPv6 + DNS + HOST ���Է��� Google ��֧�� IPv6 Э�����վ�����Գɹ��У�
          Googleϵ�����������䡢���롢��ͼ�ȣ� / Youtube / IPTV / Facebook
          Baidu / Bing / Githubϵ����ҳ��Pages��/ Flickr / Tumblr
          Telegramϵ��Telegram + Telegraph��/ Bilibili����Ȩ�ڣ�
          Reddit / Pinterest / �����ƣ�GPDR���ƣ�/ UNSPLASH
�����£�2018-09-12 08:52
============================================================#

## ? ��������

1. �Զ�ʶ��ϵͳʱ��
2. ����ڹ������賿����֮ǰ��Ϊ�����Ķ���ʱ�䣬����ʱ�� IPv4 ����ֹ��IPv6 ��������������
 - ��1������ IPv4���޸� IPv6 DNS Ϊ NAT64 ������ DNS
 - ��2������ IPv6 HOST Ϊ�ܹ���ȷ�����ȸ輰������������IPv6վ���ַ�ĸ�ʽ
3. ����ڹ������賿����֮�󣬻�����ĩ����
 - ��1������ IPv4���޸� IPv6 Ϊ DHCP
 - ��2��ͬ������ IPv6 HOST
4. ����Ƿǻ���ѧ��ʹ�ã�����Уû�ж���������£����ڰ������иýű�һ�μ��ɡ�������������µĿ�ѡ������
5. ע�⣬�ű�ʹ�õ�ǰ���ǵ�ǰ������֧�� IPv6

## ? v6_y.ps1 �ű�ʹ��

1. ʹ��Ĭ�Ϲ��ܣ�ֱ��˫�� v6_y.bat ���ɣ�
2. ʹ�ÿ�ѡ���ܣ�
 - ���¿�ݼ� `win + x` �� Powershell������ `cd \�ű�����·��` ������ýű���·������������ `.\v6_y.ps1 2` �������ÿ�ѡ����
 - ���¿�ݼ� `win + r` �����У����� `cmd` �������У����� `cd \�ű�����·��` ������ýű���·������������ `Powershell .\v6_y.ps1 2` �������ÿ�ѡ����

## ? v6_y.ps1 �ű�ע��

1�� �ļ����й�������ļ���

- v6_y.ps1 --> ��Ҫ��ִ���ļ��������ʽΪ GB18030����Ҫ��
- setup.bat --> һ���ű���˫�����м��ɣ������ʽΪ GB18030����Ҫ��
- README.txt --> �˽ű���˵���ļ�
- host --> IPv6 HOST �ļ�����Ҫ��
- PACK.zip --> Դ���룬UTF-8 ����

2��ע�⣺

- ���������޸�Դ���룬���ѹ PACK.zip �е��ļ����в���
- �Ƽ�ʹ�� VScode �༭�������Է�����ڵײ���״̬���л�����
- ��Ҫ��ʹ�� VScode �༭���л�����ʱ�ᵯ������ѡ�
- ��1��ʹ���µı����ʽ�򿪣���2������Ϊ�µı����ʽ
- �Ƽ�ʹ�� UTF-8 �����޸������еĴ���֮�����Ϊ�µ��ļ����ٱ���Ϊ GB18030 ����
#>

# ���������Ϣ
$out_put = "`
#===========================================================================================# `
# �ű����ƣ�v6_y.ps1 `
# �ű����ߣ�Stephen Tseng | https://www.ynewtime.com `
# �ű����ܣ��Զ�ʶ�𱾻�����������Ϊ�� IPv6 `
# Ĭ�Ϲ��ܣ�v6_y.ps1 --> `
#  1. Ĭ�ϲ���Ҫ���� `
#  2. �Զ�ʶ��ǰʱ���Ƿ�Ϊ�����Ķ���ʱ�� `
#  3. ��Ϊ�Ƕ���ʱ�䣬�����õ��ԣ�1������ IPv6����2����� HOST ���� `
#  4. ��Ϊ�����¼�����1�����ñ��ص� IPv4����2������ IPv6 DNS �� HOST `
# ��ѡ������v6_y.ps1 2 -->  `
#  *. ������� 2�����ֹ�������������������� IPv6 ���ܣ���������Ϊ�� IPv4 `
# ����˵������ IPv4 ��ƽʱ�Ƕ���ʱ������ʹ�õ�����������˲�û�п��� IPv6�� `
# ������ʾ���� IPv6 + DNS + HOST ���Է��� Google ��֧�� IPv6 Э�����վ�����Գɹ��У� `
#           Googleϵ�����������䡢���롢��ͼ�ȣ� / Youtube / IPTV / Facebook `
#           Baidu / Bing / Githubϵ����ҳ��Pages��/ Flickr / Tumblr `
#           Telegramϵ��Telegram + Telegraph��/ Bilibili����Ȩ�ڣ� `
#           Reddit / Pinterest / �����ƣ�GPDR���ƣ�/ UNSPLASH `
# �����£�2018-09-12 08:52 `
#===========================================================================================# "

$out_put_1 = "`
#===================#`
ѡ��Ĭ��ģʽ `
�ȴ����ű�ִ���� `
״̬�����ڿ��� IPv6 "

$out_put_2 = "`
ѡ�񣺽���ģʽ `
�ȴ����ű�ִ���� `
#===================#`
״̬�����ڽ��� IPv6 "

$root = Split-Path -Parent $MyInvocation.MyCommand.Definition # ��õ�ǰ�ű���·��
$hosts = $root + '\hosts'
$hosts_dir = "C:\windows\system32\drivers\etc\hosts" # ���� hosts �ļ��Ĵ���·��
# $hosts_url = "https://raw.githubusercontent.com/lennylxx/ipv6-hosts/master/hosts" 
# hosts�ļ���Ȩ��ѭ��Ӧ����ĿLICENSE

# ��������ģʽ�� 2����رձ��������������� IPv6 Э��
if($args[0] -eq 2)
{
    # ͨ����һ���߱�����ԱȨ�޵� Powershell ���������нű����ܿ�����ԱȨ�޵����Ȼ�ã�ͬʱ����$args[0]��ȷ���ű���ȷ����
    If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {   
        $arguments = "& '" + $myinvocation.mycommand.definition + "'"
        Start-Process powershell -Verb runAs -ArgumentList $arguments,$args[0]
        Break
    }
    
    # ����ȴ���Ϣ...
    echo $out_put
    echo $out_put_2

    # �رձ������������������� IPv6
    Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6

    echo "״̬������ IPv6 �ɹ�"
    echo "״̬��ˢ�� DNS ����"
    # ˢ�±����� DNS ���档
    ipconfig /flushdns | Out-Null
    echo "�����DNS ˢ�³ɹ�"
    echo "���������ģʽ����"

    # �����ǰ����������Ϣ
    echo "��ǰ����������ϢΪ��"
    ipconfig

    Start-Sleep 5

    echo "������ű�ִ�гɹ�"
    echo "�ȴ� 10s �Զ��ر�"
    Start-Sleep 10
}
# ��������ģʽ���� 2����
# 1. ���ȿ������������������� IPv6 Э��
# 2. ���ݱ�����ǰ��ʱ���ж��Ƿ��ǻ����Ķ���ʱ�䣬
#    ����ǣ���1���ı� DNS Ϊ�̶�����2������ HOST
#    ������ǣ���1���ı� DNS Ϊ DHCP����2������ HOST
else
{
    # ͨ����һ���߱�����ԱȨ�޵� Powershell ���������нű����ܿ�����ԱȨ�޵����Ȼ�á�
    If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
    {   
        $arguments = "& '" + $myinvocation.mycommand.definition + "'"
        Start-Process powershell -Verb runAs -ArgumentList $arguments
        Break
    }

    # ����ȴ���Ϣ...
    echo $out_put
    echo $out_put_1

    # ������������������������ IPv6 Э��
    Enable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6
    echo "��������� IPv6 �ɹ�"
    echo "#=====================#"
    
    # ˢ�±����� DNS ���档
    echo "״̬��ˢ�� DNS ����"
    ipconfig /flushdns | Out-Null
    echo "�����DNS ˢ�³ɹ�"
    echo "#=====================#"

    # �����ǰϵͳʱ�䴦����һ�������賿��㵽�����ʱ��Σ���
    # 1. ���ı��� IPv6 DNS Ϊ 240c::6644
    # 2. ���ñ��� HOST ���� IPv6 ��ַ
    if( ((Get-Date).DayOfWeek -le 5) -and ((Get-Date).Hour -lt 6) ) 
    {
        # ʱ��Ͷ����ж�
        echo "������ǰʱ��Ϊ��", "$(Get-Date)"
        echo "״̬�����ڶ���ʱ��"
        echo "#=====================#"

        # ���ñ������������������� IPv4 Э�飬�����ڼ� IPv4 ȫջ���⣬���Խ��ã�ȷ���������� IPv6 ��·
        # ע�⣬���ú�����ڷǶ���ʱ����Ҫ���¿�����ֻ��Ҫ����һ�� v6_y.ps1 ������
        echo "״̬�����ڽ��� IPv4"
        Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip
        echo "��������� IPv4 �ɹ�"
        echo "#=====================#"

        # ���ı��������������� IPv6 DNS Ϊ 240c::6644
        echo "״̬���������� IPv6 DNS"
        Get-DnsClientServerAddress -AddressFamily IPv6 |
        foreach {
            Set-DnsClientServerAddress -InterfaceIndex $_.InterfaceIndex -Addresses '240c::6644'
        }
        echo "�����IPv6 DNS���óɹ�"
        echo "#=====================#"

        # ���� IPv6 HOST
        echo "״̬���������� IPv6 HOST"
        Copy-Item $hosts -Destination $hosts_dir -Force
        echo "״̬��IPv6 HOST���óɹ�"
        echo "#======================#"
        echo "�����IPv6 HOST���óɹ�"
        echo "#======================#"

        # ˢ�±����� DNS ���档
        echo "״̬��ˢ�� DNS ����"
        ipconfig /flushdns | Out-Null
        echo "�����DNS ˢ�³ɹ�"
        echo "#================================#"
        echo "������� IPv6 ������������������"
        echo "#================================#"
        Start-Sleep 3

        # �����ǰ����������Ϣ
        echo "��ǰ����������ϢΪ��"
        ipconfig

        Start-Sleep 5

        # ���򿪼��±��鿴������ HOSTS �ļ��Ƿ����޸ġ�
        echo "״̬���򿪼��±��鿴"
        Start-Process notepad -Verb runas -ArgumentList $env:windir\System32\drivers\etc\hosts

        echo "������ű�ִ�гɹ�!"
        echo "#================================#"
        echo "�ȴ� 10s �Զ��ر�"
        Start-Sleep 10
    }
    # �����ǰϵͳʱ�䴦����һ�������賿���㵽����ʮ���㣬����ĩ������ʱ��Σ���
    # 1. ���ı��������������� IPv6 DNS Ϊ DHCP
    # 2. ���ñ��� HOST ���� IPv6 ��ַ
    else
    {
        # ʱ��Ͷ����ж�
        echo "������ǰʱ��Ϊ��", "$(Get-Date)"
        echo "״̬�����ڷǶ���ʱ��"
        echo "#=====================#"     

        # ���� IPv6 HOST
        echo "״̬���������� IPv6 HOST"
        Copy-Item $hosts -Destination $hosts_dir -Force
        echo "״̬��IPv6 HOST���óɹ�"
        echo "#=====================#"
        echo "�����IPv6 HOST���óɹ�"
        echo "#=====================#"

        # ���ñ������������������� IPv4 Э��
        echo "״̬���������� IPv4"
        Enable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip
        echo "��������� IPv4 �ɹ�"
        echo "#=====================#"

        # ���ı��������������� IPv6 DNS Ϊ DHCP
        echo "״̬���������� IPv6 DHCP"
        Get-DnsClientServerAddress -AddressFamily IPv6 |
        foreach {
            Set-DnsClientServerAddress -InterfaceIndex $_.InterfaceIndex -ResetServerAddresses
        }
        echo "�����IPv6 DHCP���óɹ�"
        echo "#=====================#"

        # ���ı��������������� IPv4 DNS Ϊ 8.8.8.8, 4.4.4.4
        echo "״̬���������� IPv4 DNS"
        Get-DnsClientServerAddress -AddressFamily IPv4 |
        foreach {
            Set-DnsClientServerAddress -InterfaceIndex $_.InterfaceIndex -Addresses '8.8.8.8','4.4.4.4'
        }
        echo "�����IPv4 DNS���óɹ�"
        echo "#=====================#"

        # ˢ�±����� DNS ���档
        echo "״̬��ˢ�� DNS ����"
        ipconfig /flushdns | Out-Null
        echo "�����DNS ˢ�³ɹ�"
        echo "#================================#"
        echo "������� IPv6 ������������������"
        echo "#================================#"

        # �����ǰ����������Ϣ
        Start-Sleep 3
        echo "��ǰ����������ϢΪ��"
        ipconfig

        Start-Sleep 5

        # ���򿪼��±��鿴������ HOSTS �ļ��Ƿ����޸ġ�
        echo "״̬���򿪼��±��鿴"
        Start-Process notepad -Verb runas -ArgumentList $env:windir\System32\drivers\etc\hosts

        echo "������ű�ִ�гɹ�!"
        echo "#================================#"
        echo "�ȴ� 10s �Զ��ر�"
        Start-Sleep 10
    }
}
