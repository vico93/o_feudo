


// Embaralha um array de inteiros
// array - O array de inteiros a ser embaralhado
// count - O número de elementos no array
//
// Retorna 1 se o array foi embaralhado com sucesso, caso contrário, retorna 0
stock embaralhar_array(array[], count)
{
    if (count < 2)
    {
        // Não há o suficiente elementos para embaralhar
        return 0;
    }

    // Embaralha o array
    for (new i = 0; i < count; i++)
    {
        new j = random(count);
        new temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }

    return 1;
}
