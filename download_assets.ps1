$images = @(
    "https://projetogeniobrasil.com.br/robotica/assets/hero-bg.webp",
    "https://projetogeniobrasil.com.br/robotica/assets/hero-bg-LiBD0rkx.webp",
    "https://projetogeniobrasil.com.br/robotica/assets/ChatGPT_Image_14_de_jan._de_2026__17_38_46_1768423131709-CZ-7yF6d.png",
    "https://projetogeniobrasil.com.br/robotica/assets/ChatGPT_Image_14_de_jan._de_2026__18_02_27_1768424637264-DV0k-iUv.png",
    "https://projetogeniobrasil.com.br/robotica/assets/bonus1-cover-BKbk0fYm.webp",
    "https://projetogeniobrasil.com.br/robotica/assets/Cópia_de_Cópia_de_Cópia_de_Sem_nome_(1)_1767588095961-DYmSd7iC.png",
    "https://projetogeniobrasil.com.br/robotica/assets/Cópia_de_Cópia_de_Cópia_de_Cópia_de_Cópia_de_Cópia_de_Cópia_de_1768444927138-DVmjcVuF.png",
    "https://projetogeniobrasil.com.br/robotica/assets/Projeto_Gênio_Brasil_1768444391428-BbgSWkS8.png",
    "https://projetogeniobrasil.com.br/robotica/assets/Design_sem_nome_(8)_1767764365238-2VvuE11C.png"
)

foreach ($url in $images) {
    $filename = $url.Split("/")[-1]
    $dest = "assets/images/$filename"
    Write-Host "Downloading $url to $dest"
    Invoke-WebRequest -Uri $url -OutFile $dest
}
